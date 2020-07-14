Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E54521E784
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 07:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgGNFdP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 01:33:15 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:38972 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgGNFdO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 01:33:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436338|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0151357-0.000846497-0.984018;FP=13576776720455336179|3|2|11|0|-1|-1|-1;HT=e01l10434;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1QwJ79_1594704779;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1QwJ79_1594704779)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 13:33:08 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 3/5] MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
Date:   Tue, 14 Jul 2020 13:32:27 +0800
Message-Id: <20200714053229.33195-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a device tree and a defconfig for the Ingenic X1830 based
YSH & ATIL CU Neo board.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Add DT node for LED.
    2.Update defconfig for LED.
    
    v2->v3:
    Adjust the order of nodes according to the
    corresponding address value.
    
    v3->v4:
    No change.

 arch/mips/boot/dts/ingenic/Makefile       |   1 +
 arch/mips/boot/dts/ingenic/cu1830-neo.dts | 168 ++++++++++++++++++++++++++++++
 arch/mips/configs/cu1830-neo_defconfig    | 123 ++++++++++++++++++++++
 arch/mips/jz4740/Kconfig                  |   4 +
 4 files changed, 296 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
 create mode 100644 arch/mips/configs/cu1830-neo_defconfig

diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index e1654291a7b0..c33434fad007 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -3,5 +3,6 @@ dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
 dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
 dtb-$(CONFIG_X1000_CU1000_NEO)	+= cu1000-neo.dtb
+dtb-$(CONFIG_X1830_CU1830_NEO)	+= cu1830-neo.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ingenic/cu1830-neo.dts b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
new file mode 100644
index 000000000000..640f96c00d63
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "x1830.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "yna,cu1830-neo", "ingenic,x1830";
+	model = "YSH & ATIL General Board CU1830-Neo";
+
+	aliases {
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-0 {
+			gpios = <&gpc 17 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+		};
+	};
+
+	wlan_pwrseq: msc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpc 13 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&exclk {
+	clock-frequency = <24000000>;
+};
+
+&tcu {
+	/* 1500 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <1500000>, <1500000>;
+
+	/* Use channel #0 for the system timer channel #2 for the clocksource */
+	ingenic,pwm-channels-mask = <0xfa>;
+};
+
+&uart1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart1>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c0>;
+
+	ads7830: adc@48 {
+		compatible = "ti,ads7830";
+		reg = <0x48>;
+	};
+};
+
+&msc0 {
+	status = "okay";
+
+	bus-width = <4>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc0>;
+
+	non-removable;
+};
+
+&msc1 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc1>;
+
+	non-removable;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	ap6212a: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpc>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wake";
+
+		brcm,drive-strength = <10>;
+	};
+};
+
+&mac {
+	status = "okay";
+
+	phy-mode = "rmii";
+	phy-handle = <&ip101gr>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mac>;
+
+	snps,reset-gpio = <&gpb 28 GPIO_ACTIVE_LOW>; /* PB28 */
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+};
+
+&mdio {
+	status = "okay";
+
+	ip101gr: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0243.0c54", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&pinctrl {
+	pins_uart1: uart1 {
+		function = "uart1";
+		groups = "uart1-data";
+		bias-pull-up;
+	};
+
+	pins_i2c0: i2c0 {
+		function = "i2c0";
+		groups = "i2c0-data";
+		bias-pull-up;
+	};
+
+	pins_msc0: msc0 {
+		function = "mmc0";
+		groups = "mmc0-1bit", "mmc0-4bit";
+		bias-disable;
+	};
+
+	pins_msc1: msc1 {
+		function = "mmc1";
+		groups = "mmc1-1bit", "mmc1-4bit";
+		bias-disable;
+	};
+
+	pins_mac: mac {
+		function = "mac";
+		groups = "mac";
+		bias-disable;
+	};
+};
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
new file mode 100644
index 000000000000..cbfb62900273
--- /dev/null
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -0,0 +1,123 @@
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_KERNEL_GZIP=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_MACH_INGENIC=y
+CONFIG_X1830_CU1830_NEO=y
+CONFIG_HIGHMEM=y
+CONFIG_HZ_100=y
+# CONFIG_SECCOMP is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPACTION is not set
+CONFIG_CMA=y
+CONFIG_CMA_AREAS=7
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CFG80211=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_ICPLUS_PHY=y
+CONFIG_BRCMFMAC=y
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_LEGACY_PTY_COUNT=2
+CONFIG_SERIAL_EARLYCON=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_INGENIC=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+CONFIG_I2C_JZ4780=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_SENSORS_ADS7828=y
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_JZ4740=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_JZ4740=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SYSFS=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_AUTOFS_FS=y
+CONFIG_PROC_KCORE=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_936=y
+CONFIG_NLS_CODEPAGE_950=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+CONFIG_DEBUG_INFO=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=10
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_STACKTRACE=y
+# CONFIG_FTRACE is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index cd0ddb52da99..6c065dcaeff8 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -27,6 +27,10 @@ config X1000_CU1000_NEO
 	bool "YSH & ATIL CU1000 Module with Neo backplane"
 	select MACH_X1000
 
+config X1830_CU1830_NEO
+	bool "YSH & ATIL CU1830 Module with Neo backplane"
+	select MACH_X1830
+
 endchoice
 
 config MACH_JZ4740
-- 
2.11.0

