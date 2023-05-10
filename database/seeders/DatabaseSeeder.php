<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class DatabaseSeeder extends Seeder
{
    
    public function run(): void
    {
        $user= User::create([
            'name'=>'Delcy2023',
            'email'=>'cezar_mh86@hotmail.com',
            'password'=> Hash::make('Samjo3007')
        ]);
    }
}
