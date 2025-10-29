import eslintConfigPrettier from 'eslint-config-prettier';
import prettier from 'eslint-plugin-prettier';
import baseConfig from '../../eslint.config';

export default [
  ...baseConfig,
  {
    files: ['src/**/*.ts'],
    languageOptions: {
      parserOptions: {
        project: './tsconfig.json',
      },
    },
    plugins: {
      prettier,
    },
    rules: {
      '@typescript-eslint/no-unused-vars': ['warn'],
      'prettier/prettier': 'error',
    },
  },
  eslintConfigPrettier,
];
