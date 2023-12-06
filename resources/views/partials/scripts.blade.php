{{-- Bootstrap 5.2 JS --}}
<script src="{{ asset('bootstrap5/js/bootstrap.bundle.min.js') }}"></script>

<script src="{{ asset('js/feather.min.js') }}"></script>

<script>
    feather.replace({ 'aria-hidden': 'true' })
</script>

{{-- Main JS --}}
<script type="module" src="{{ asset('js/main.js') }}"></script>
{{-- Livewire JS --}}
@livewireScripts