/*
 Copyright (c) 2013 yvt
 
 This file is part of OpenSpades.
 
 OpenSpades is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 OpenSpades is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with OpenSpades.  If not, see <http://www.gnu.org/licenses/>.
 
 */
 
 namespace spades {
	class ThirdPersonRifleSkin: 
	IToolSkin, IThirdPersonToolSkin, IWeaponSkin {
		private float sprintState;
		private float raiseState;
		private Vector3 teamColor;
		private bool muted;
		private Matrix4 originMatrix;
		private float aimDownSightState;
		private float readyState;
		private bool reloading;
		private float reloadProgress;
		private int ammo, clipSize;
		
		float SprintState { 
			set { sprintState = value; }
		}
		
		float RaiseState { 
			set { raiseState = value; }
		}
		
		Vector3 TeamColor { 
			set { teamColor = value; } 
		}
		
		bool IsMuted {
			set { muted = value; }
		}
		
		Matrix4 OriginMatrix {
			set { originMatrix = value; }
		}
		
		float PitchBias {
			get { return 0.f; }
		}
		
		float AimDownSightState {
			set { aimDownSightState = value; }
		}
		
		bool IsReloading {
			set { reloading = value; }
		}
		float ReloadProgress {
			set { reloadProgress = value; }
		}
		int Ammo {
			set { ammo = value; }
		}
		int ClipSize {
			set { clipSize = value; }
		}
		
		float ReadyState {
			set { readyState = value; }
		}
		
		private Renderer@ renderer;
		private AudioDevice@ audioDevice;
		private Model@ model;
		
		private AudioChunk@[] fireSounds(4);
		private AudioChunk@[] fireMediumSounds(4);
		private AudioChunk@ fireFarSound;
		private AudioChunk@ fireStereoSound;
		private AudioChunk@[] fireMechSounds(4);
		private AudioChunk@ reloadSound;
		
		private Image@[] muzzleFlashes(20);
		
		private float globalScale = 0.006f;
		private Vector3 weaponPivot = Vector3(5.f, 57.f, 20.f);
		
		private int flashTextureRand1 = GetRandom(muzzleFlashes.length);
		private int flashTextureRand2 = GetRandom(muzzleFlashes.length);
		private int flashTextureRand3 = GetRandom(muzzleFlashes.length);
		private int flashTextureRand4 = GetRandom(muzzleFlashes.length);
		
		private float flashRotationRand1 = GetRandom() * PiF * 2;
		private float flashRotationRand2 = GetRandom() * PiF * 2;
		private float flashRotationRand3 = GetRandom() * PiF * 2;
		private float flashRotationRand4 = GetRandom() * PiF * 2;
		
		ThirdPersonRifleSkin(Renderer@ r, AudioDevice@ dev) {
			@renderer = r;
			@audioDevice = dev;
			@model = renderer.RegisterModel
				("Models/Weapons/Rifle/Weapon.kv6");
				
				
			@fireSounds[0] = dev.RegisterSound
				("Sounds/Weapons/Rifle/Fire1.wav");
			@fireSounds[1] = dev.RegisterSound
				("Sounds/Weapons/Rifle/Fire2.wav");
			@fireSounds[2] = dev.RegisterSound
				("Sounds/Weapons/Rifle/Fire3.wav");
			@fireSounds[3] = dev.RegisterSound
				("Sounds/Weapons/Rifle/Fire4.wav");
			@fireMediumSounds[0] = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireMedium1.wav");
			@fireMediumSounds[1] = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireMedium2.wav");
			@fireMediumSounds[2] = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireMedium3.wav");
			@fireMediumSounds[3] = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireMedium4.wav");
			@fireFarSound = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireFar.wav");
			@fireStereoSound = dev.RegisterSound
				("Sounds/Weapons/Rifle/FireStereo.wav");
			@reloadSound = dev.RegisterSound
				("Sounds/Weapons/Rifle/Reload.wav");
				
				
			for (int i = 0; i < 20; i++){ // can't use sprintf, settling for this instead
				string dir = "Gfx/Flash/Weapons/Rifle/";
				dir += i / 100; // hundreds
				dir += i % 100 / 10; // tens
				dir += i % 10;// units
				dir += ".png";
				@muzzleFlashes[i] = renderer.RegisterImage(dir);
			}
				
		}
		
		void Update(float dt) {
		}
		
		void WeaponFired(){
		
			flashTextureRand1 = GetRandom(muzzleFlashes.length);
			flashTextureRand2 = GetRandom(muzzleFlashes.length);
			flashTextureRand3 = GetRandom(muzzleFlashes.length);
			flashTextureRand4 = GetRandom(muzzleFlashes.length);
			
			flashRotationRand1 = GetRandom() * PiF * 2;
			flashRotationRand2 = GetRandom() * PiF * 2;
			flashRotationRand3 = GetRandom() * PiF * 2;
			flashRotationRand4 = GetRandom() * PiF * 2;
		
			if(!muted){
				Vector3 origin = originMatrix * Vector3(0.f, 0.f, 0.f);
				AudioParam param;
				param.volume = 9.f;
				audioDevice.Play(fireMediumSounds[GetRandom(fireMediumSounds.length)], origin, param);
				
				param.volume = .4f;
				param.referenceDistance = 5.f;
				audioDevice.Play(fireFarSound,  origin, param);
				param.referenceDistance = 1.f;
				audioDevice.Play(fireStereoSound, origin, param);
				
				
			}
		}
		void ReloadingWeapon() {
			if(!muted){
				Vector3 origin = originMatrix * Vector3(0.f, 0.f, 0.f);
				AudioParam param;
				param.volume = 0.2f;
				audioDevice.Play(reloadSound, origin, param);
			}
		}
		
		void ReloadedWeapon() {
		}
		
		void AddToScene() {
			Matrix4 mat = CreateScaleMatrix(globalScale);
			mat = mat * CreateScaleMatrix(-1.f, -1.f, 1.f);
			mat = CreateTranslateMatrix(0.35f, -0.8f, 0.0f) * mat;
			
			ModelRenderParam param;
			param.matrix = originMatrix * mat;
			renderer.AddModel(model, param);
			
			if (readyState < 0.04f * 9.f) { // muzzle flash appears for 0.04 seconds (at least 2 frames @ 30 fps or 3 frames @ 60 fps to solve screen tearing
				Vector4 col = Vector4(1.f, 0.7f, 0.4f, 0.f);
				renderer.ColorP = col;
				renderer.AddSprite(muzzleFlashes[flashTextureRand1], (originMatrix * mat) * Vector3(0, 80.f, -11.5f), 0.6f, flashRotationRand1);
				renderer.AddSprite(muzzleFlashes[flashTextureRand2], (originMatrix * mat) * Vector3(0, 80.f, -11.5f), 0.8f, flashRotationRand2);
				renderer.AddSprite(muzzleFlashes[flashTextureRand3], (originMatrix * mat) * Vector3(0, 100.f, -11.5f), 0.7f, flashRotationRand3);
				renderer.AddSprite(muzzleFlashes[flashTextureRand4], (originMatrix * mat) * Vector3(0, 110.0f, -11.5f), 0.6f, flashRotationRand4);
			}
		}
	}
	
	IWeaponSkin@ CreateThirdPersonRifleSkin(Renderer@ r, AudioDevice@ dev) {
		return ThirdPersonRifleSkin(r, dev);
	}
}
