Return-Path: <linux-mips+bounces-7-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF537E7F3B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Nov 2023 18:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A44AB218FE
	for <lists+linux-mips@lfdr.de>; Fri, 10 Nov 2023 17:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6833D3A291;
	Fri, 10 Nov 2023 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1B3A269
	for <linux-mips@vger.kernel.org>; Fri, 10 Nov 2023 17:47:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26CA1BFF
	for <linux-mips@vger.kernel.org>; Fri, 10 Nov 2023 07:31:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT1-00066X-WF; Fri, 10 Nov 2023 16:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TSy-0083Ip-Hq; Fri, 10 Nov 2023 16:30:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TSy-00Gnuv-6r; Fri, 10 Nov 2023 16:30:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Petr Mladek <pmladek@suse.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Johan Hovold <johan@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel@pengutronix.de,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 03/52] serial: 8250: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:29:31 +0100
Message-ID: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17844; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SBPFcKWa6NB/v/5MNIwJgX3pYO+Ck7IZD+w6LhM7A7A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTkxbmWyzh3UImIKd3qRLPqxwKSuSyHHtCPBeN EIGT55g+saJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU5MWwAKCRCPgPtYfRL+ TtGmCACmOvIoBxQVB+3Uhb3EeMk/Iq+XIcbCzKxG8psKsMcks/lhsquBdNP42CTlD+Y2NyB0uxI 2DsR59ZA5kSck2DemqiGqmtW0Oj4O7iq9D7Rwid9MK2EGGKaNPJFxj9Herc0jrV35onWeiQaYyt UrtcqhTOxyu/EPXCL3bgj+p8QtbvfcZm/p6OscPgC2T8oyoOHC2hsQLvY8k5GmZPQQW4ve90ivb 4XC+JLDxahgWipWD4KqAwyAygQ0GmpiLVNk+UDREzO828rw5DMwzk7c+pQMH9zvDSf4D3LB6tnw epL3X9KMWFqvJzeaOpjJcmMW6b1xpcv0S6Hdkq0xr9JIUvHR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 6 ++----
 drivers/tty/serial/8250/8250_bcm2835aux.c   | 6 ++----
 drivers/tty/serial/8250/8250_bcm7271.c      | 5 ++---
 drivers/tty/serial/8250/8250_core.c         | 5 ++---
 drivers/tty/serial/8250/8250_dw.c           | 6 ++----
 drivers/tty/serial/8250/8250_em.c           | 5 ++---
 drivers/tty/serial/8250/8250_fsl.c          | 5 ++---
 drivers/tty/serial/8250/8250_ingenic.c      | 5 ++---
 drivers/tty/serial/8250/8250_ioc3.c         | 5 ++---
 drivers/tty/serial/8250/8250_lpc18xx.c      | 6 ++----
 drivers/tty/serial/8250/8250_mtk.c          | 6 ++----
 drivers/tty/serial/8250/8250_of.c           | 5 ++---
 drivers/tty/serial/8250/8250_omap.c         | 5 ++---
 drivers/tty/serial/8250/8250_pxa.c          | 6 ++----
 drivers/tty/serial/8250/8250_tegra.c        | 6 ++----
 drivers/tty/serial/8250/8250_uniphier.c     | 6 ++----
 16 files changed, 32 insertions(+), 56 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index d7482ae33a1c..8c2aaf7af7b7 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -566,7 +566,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int aspeed_vuart_remove(struct platform_device *pdev)
+static void aspeed_vuart_remove(struct platform_device *pdev)
 {
 	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
 
@@ -574,8 +574,6 @@ static int aspeed_vuart_remove(struct platform_device *pdev)
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->line);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
-
-	return 0;
 }
 
 static const struct of_device_id aspeed_vuart_table[] = {
@@ -590,7 +588,7 @@ static struct platform_driver aspeed_vuart_driver = {
 		.of_match_table = aspeed_vuart_table,
 	},
 	.probe = aspeed_vuart_probe,
-	.remove = aspeed_vuart_remove,
+	.remove_new = aspeed_vuart_remove,
 };
 
 module_platform_driver(aspeed_vuart_driver);
diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
index 15a2387a5b25..b5760f914a8c 100644
--- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -195,14 +195,12 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int bcm2835aux_serial_remove(struct platform_device *pdev)
+static void bcm2835aux_serial_remove(struct platform_device *pdev)
 {
 	struct bcm2835aux_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
 	clk_disable_unprepare(data->clk);
-
-	return 0;
 }
 
 static const struct bcm2835_aux_serial_driver_data bcm2835_acpi_data = {
@@ -228,7 +226,7 @@ static struct platform_driver bcm2835aux_serial_driver = {
 		.acpi_match_table = bcm2835aux_serial_acpi_match,
 	},
 	.probe  = bcm2835aux_serial_probe,
-	.remove = bcm2835aux_serial_remove,
+	.remove_new = bcm2835aux_serial_remove,
 };
 module_platform_driver(bcm2835aux_serial_driver);
 
diff --git a/drivers/tty/serial/8250/8250_bcm7271.c b/drivers/tty/serial/8250/8250_bcm7271.c
index 55dea2539c47..504c4c020857 100644
--- a/drivers/tty/serial/8250/8250_bcm7271.c
+++ b/drivers/tty/serial/8250/8250_bcm7271.c
@@ -1121,7 +1121,7 @@ static int brcmuart_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int brcmuart_remove(struct platform_device *pdev)
+static void brcmuart_remove(struct platform_device *pdev)
 {
 	struct brcmuart_priv *priv = platform_get_drvdata(pdev);
 
@@ -1131,7 +1131,6 @@ static int brcmuart_remove(struct platform_device *pdev)
 	brcmuart_free_bufs(&pdev->dev, priv);
 	if (priv->dma_enabled)
 		brcmuart_arbitration(priv, 0);
-	return 0;
 }
 
 static int __maybe_unused brcmuart_suspend(struct device *dev)
@@ -1207,7 +1206,7 @@ static struct platform_driver brcmuart_platform_driver = {
 		.of_match_table = brcmuart_dt_ids,
 	},
 	.probe		= brcmuart_probe,
-	.remove		= brcmuart_remove,
+	.remove_new	= brcmuart_remove,
 };
 
 static int __init brcmuart_init(void)
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 912733151858..b62ad9006780 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -883,7 +883,7 @@ static int serial8250_probe(struct platform_device *dev)
 /*
  * Remove serial ports registered against a platform device.
  */
-static int serial8250_remove(struct platform_device *dev)
+static void serial8250_remove(struct platform_device *dev)
 {
 	int i;
 
@@ -893,7 +893,6 @@ static int serial8250_remove(struct platform_device *dev)
 		if (up->port.dev == &dev->dev)
 			serial8250_unregister_port(i);
 	}
-	return 0;
 }
 
 static int serial8250_suspend(struct platform_device *dev, pm_message_t state)
@@ -926,7 +925,7 @@ static int serial8250_resume(struct platform_device *dev)
 
 static struct platform_driver serial8250_isa_driver = {
 	.probe		= serial8250_probe,
-	.remove		= serial8250_remove,
+	.remove_new	= serial8250_remove,
 	.suspend	= serial8250_suspend,
 	.resume		= serial8250_resume,
 	.driver		= {
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index b94f567647cb..63b14ce9c009 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,7 +663,7 @@ static int dw8250_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dw8250_remove(struct platform_device *pdev)
+static void dw8250_remove(struct platform_device *pdev)
 {
 	struct dw8250_data *data = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -680,8 +680,6 @@ static int dw8250_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-
-	return 0;
 }
 
 static int dw8250_suspend(struct device *dev)
@@ -789,7 +787,7 @@ static struct platform_driver dw8250_platform_driver = {
 		.acpi_match_table = dw8250_acpi_match,
 	},
 	.probe			= dw8250_probe,
-	.remove			= dw8250_remove,
+	.remove_new		= dw8250_remove,
 };
 
 module_platform_driver(dw8250_platform_driver);
diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index ef5019e944ea..a754755100ff 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -200,12 +200,11 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int serial8250_em_remove(struct platform_device *pdev)
+static void serial8250_em_remove(struct platform_device *pdev)
 {
 	struct serial8250_em_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
-	return 0;
 }
 
 static const struct of_device_id serial8250_em_dt_ids[] = {
@@ -220,7 +219,7 @@ static struct platform_driver serial8250_em_platform_driver = {
 		.of_match_table = serial8250_em_dt_ids,
 	},
 	.probe			= serial8250_em_probe,
-	.remove			= serial8250_em_remove,
+	.remove_new		= serial8250_em_remove,
 };
 
 module_platform_driver(serial8250_em_platform_driver);
diff --git a/drivers/tty/serial/8250/8250_fsl.c b/drivers/tty/serial/8250/8250_fsl.c
index f522eb5026c9..5cf675eadefe 100644
--- a/drivers/tty/serial/8250/8250_fsl.c
+++ b/drivers/tty/serial/8250/8250_fsl.c
@@ -159,12 +159,11 @@ static int fsl8250_acpi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl8250_acpi_remove(struct platform_device *pdev)
+static void fsl8250_acpi_remove(struct platform_device *pdev)
 {
 	struct fsl8250_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
-	return 0;
 }
 
 static const struct acpi_device_id fsl_8250_acpi_id[] = {
@@ -179,7 +178,7 @@ static struct platform_driver fsl8250_platform_driver = {
 		.acpi_match_table	= ACPI_PTR(fsl_8250_acpi_id),
 	},
 	.probe			= fsl8250_acpi_probe,
-	.remove			= fsl8250_acpi_remove,
+	.remove_new		= fsl8250_acpi_remove,
 };
 
 module_platform_driver(fsl8250_platform_driver);
diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 4c4c4da73ad0..a12f737924c0 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -320,14 +320,13 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ingenic_uart_remove(struct platform_device *pdev)
+static void ingenic_uart_remove(struct platform_device *pdev)
 {
 	struct ingenic_uart_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
 	clk_disable_unprepare(data->clk_module);
 	clk_disable_unprepare(data->clk_baud);
-	return 0;
 }
 
 static const struct ingenic_uart_config jz4740_uart_config = {
@@ -368,7 +367,7 @@ static struct platform_driver ingenic_uart_platform_driver = {
 		.of_match_table	= of_match,
 	},
 	.probe			= ingenic_uart_probe,
-	.remove			= ingenic_uart_remove,
+	.remove_new		= ingenic_uart_remove,
 };
 
 module_platform_driver(ingenic_uart_platform_driver);
diff --git a/drivers/tty/serial/8250/8250_ioc3.c b/drivers/tty/serial/8250/8250_ioc3.c
index d5a39e105a76..50c77c3dacf2 100644
--- a/drivers/tty/serial/8250/8250_ioc3.c
+++ b/drivers/tty/serial/8250/8250_ioc3.c
@@ -75,17 +75,16 @@ static int serial8250_ioc3_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int serial8250_ioc3_remove(struct platform_device *pdev)
+static void serial8250_ioc3_remove(struct platform_device *pdev)
 {
 	struct ioc3_8250_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
-	return 0;
 }
 
 static struct platform_driver serial8250_ioc3_driver = {
 	.probe  = serial8250_ioc3_probe,
-	.remove = serial8250_ioc3_remove,
+	.remove_new = serial8250_ioc3_remove,
 	.driver = {
 		.name = "ioc3-serial8250",
 	}
diff --git a/drivers/tty/serial/8250/8250_lpc18xx.c b/drivers/tty/serial/8250/8250_lpc18xx.c
index 6dc85aaba5d0..8d728a6a5991 100644
--- a/drivers/tty/serial/8250/8250_lpc18xx.c
+++ b/drivers/tty/serial/8250/8250_lpc18xx.c
@@ -182,15 +182,13 @@ static int lpc18xx_serial_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lpc18xx_serial_remove(struct platform_device *pdev)
+static void lpc18xx_serial_remove(struct platform_device *pdev)
 {
 	struct lpc18xx_uart_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
 	clk_disable_unprepare(data->clk_uart);
 	clk_disable_unprepare(data->clk_reg);
-
-	return 0;
 }
 
 static const struct of_device_id lpc18xx_serial_match[] = {
@@ -201,7 +199,7 @@ MODULE_DEVICE_TABLE(of, lpc18xx_serial_match);
 
 static struct platform_driver lpc18xx_serial_driver = {
 	.probe  = lpc18xx_serial_probe,
-	.remove = lpc18xx_serial_remove,
+	.remove_new = lpc18xx_serial_remove,
 	.driver = {
 		.name = "lpc18xx-uart",
 		.of_match_table = lpc18xx_serial_match,
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 23457daae8a1..9ff6bbe9c086 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -581,7 +581,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk8250_remove(struct platform_device *pdev)
+static void mtk8250_remove(struct platform_device *pdev)
 {
 	struct mtk8250_data *data = platform_get_drvdata(pdev);
 
@@ -591,8 +591,6 @@ static int mtk8250_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused mtk8250_suspend(struct device *dev)
@@ -652,7 +650,7 @@ static struct platform_driver mtk8250_platform_driver = {
 		.of_match_table	= mtk8250_of_match,
 	},
 	.probe			= mtk8250_probe,
-	.remove			= mtk8250_remove,
+	.remove_new		= mtk8250_remove,
 };
 module_platform_driver(mtk8250_platform_driver);
 
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index ef3e745bd09c..34f17a9785e7 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -251,7 +251,7 @@ static int of_platform_serial_probe(struct platform_device *ofdev)
 /*
  * Release a line
  */
-static int of_platform_serial_remove(struct platform_device *ofdev)
+static void of_platform_serial_remove(struct platform_device *ofdev)
 {
 	struct of_serial_info *info = platform_get_drvdata(ofdev);
 
@@ -261,7 +261,6 @@ static int of_platform_serial_remove(struct platform_device *ofdev)
 	pm_runtime_put_sync(&ofdev->dev);
 	pm_runtime_disable(&ofdev->dev);
 	kfree(info);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -337,7 +336,7 @@ static struct platform_driver of_platform_serial_driver = {
 		.pm = &of_serial_pm_ops,
 	},
 	.probe = of_platform_serial_probe,
-	.remove = of_platform_serial_remove,
+	.remove_new = of_platform_serial_remove,
 };
 
 module_platform_driver(of_platform_serial_driver);
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 661a83dbc11b..5a89a8cd7f71 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1584,7 +1584,7 @@ static int omap8250_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap8250_remove(struct platform_device *pdev)
+static void omap8250_remove(struct platform_device *pdev)
 {
 	struct omap8250_priv *priv = platform_get_drvdata(pdev);
 	struct uart_8250_port *up;
@@ -1604,7 +1604,6 @@ static int omap8250_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	cpu_latency_qos_remove_request(&priv->pm_qos_request);
 	device_init_wakeup(&pdev->dev, false);
-	return 0;
 }
 
 static int omap8250_prepare(struct device *dev)
@@ -1863,7 +1862,7 @@ static struct platform_driver omap8250_platform_driver = {
 		.of_match_table = omap8250_dt_ids,
 	},
 	.probe			= omap8250_probe,
-	.remove			= omap8250_remove,
+	.remove_new		= omap8250_remove,
 };
 module_platform_driver(omap8250_platform_driver);
 
diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
index a5b3ea27fc90..77686da42ce8 100644
--- a/drivers/tty/serial/8250/8250_pxa.c
+++ b/drivers/tty/serial/8250/8250_pxa.c
@@ -146,20 +146,18 @@ static int serial_pxa_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int serial_pxa_remove(struct platform_device *pdev)
+static void serial_pxa_remove(struct platform_device *pdev)
 {
 	struct pxa8250_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
 
 	clk_unprepare(data->clk);
-
-	return 0;
 }
 
 static struct platform_driver serial_pxa_driver = {
 	.probe          = serial_pxa_probe,
-	.remove         = serial_pxa_remove,
+	.remove_new     = serial_pxa_remove,
 
 	.driver		= {
 		.name	= "pxa2xx-uart",
diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
index 89956bbf34d9..ba352262df75 100644
--- a/drivers/tty/serial/8250/8250_tegra.c
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -128,15 +128,13 @@ static int tegra_uart_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_uart_remove(struct platform_device *pdev)
+static void tegra_uart_remove(struct platform_device *pdev)
 {
 	struct tegra_uart *uart = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(uart->line);
 	reset_control_assert(uart->rst);
 	clk_disable_unprepare(uart->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -192,7 +190,7 @@ static struct platform_driver tegra_uart_driver = {
 		.acpi_match_table = ACPI_PTR(tegra_uart_acpi_match),
 	},
 	.probe = tegra_uart_probe,
-	.remove = tegra_uart_remove,
+	.remove_new = tegra_uart_remove,
 };
 
 module_platform_driver(tegra_uart_driver);
diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index a405155264b1..6399a38ecce2 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -241,14 +241,12 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int uniphier_uart_remove(struct platform_device *pdev)
+static void uniphier_uart_remove(struct platform_device *pdev)
 {
 	struct uniphier8250_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
 	clk_disable_unprepare(priv->clk);
-
-	return 0;
 }
 
 static int __maybe_unused uniphier_uart_suspend(struct device *dev)
@@ -293,7 +291,7 @@ MODULE_DEVICE_TABLE(of, uniphier_uart_match);
 
 static struct platform_driver uniphier_uart_platform_driver = {
 	.probe		= uniphier_uart_probe,
-	.remove		= uniphier_uart_remove,
+	.remove_new	= uniphier_uart_remove,
 	.driver = {
 		.name	= "uniphier-uart",
 		.of_match_table = uniphier_uart_match,
-- 
2.42.0


