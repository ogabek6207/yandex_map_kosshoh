package uz.prep.yandex_map_kosshoh

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("21273d71-9f90-4e19-8b0e-79164cd27655")
        super.configureFlutterEngine(flutterEngine)
    }
}