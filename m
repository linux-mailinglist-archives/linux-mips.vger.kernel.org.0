Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A566A271803
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 23:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgITVD4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 17:03:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:40652 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITVDw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 17:03:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D095AAC12;
        Sun, 20 Sep 2020 21:04:25 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1300
Date:   Sun, 20 Sep 2020 23:03:46 +0200
Message-Id: <20200920210348.114999-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused config option ALCHEMY_GPIOINT_AU1300 and related code.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/alchemy/Kconfig                       |   4 -
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 137 ------------------------
 2 files changed, 141 deletions(-)

diff --git a/arch/mips/alchemy/Kconfig b/arch/mips/alchemy/Kconfig
index 83b288b95b16..827256bbe6b8 100644
--- a/arch/mips/alchemy/Kconfig
+++ b/arch/mips/alchemy/Kconfig
@@ -3,10 +3,6 @@
 config ALCHEMY_GPIOINT_AU1000
 	bool
 
-# au1300-style GPIO/INT controller
-config ALCHEMY_GPIOINT_AU1300
-	bool
-
 choice
 	prompt "Machine type"
 	depends on MIPS_ALCHEMY
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index d25846a1291f..d16add7ba49d 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -120,141 +120,4 @@ static inline int au1300_gpio_getinitlvl(unsigned int gpio)
 	return (v >> gpio) & 1;
 }
 
-/**********************************************************************/
-
-/* Linux gpio framework integration.
-*
-* 4 use cases of Alchemy GPIOS:
-*(1) GPIOLIB=y, ALCHEMY_GPIO_INDIRECT=y:
-*	Board must register gpiochips.
-*(2) GPIOLIB=y, ALCHEMY_GPIO_INDIRECT=n:
-*	A gpiochip for the 75 GPIOs is registered.
-*
-*(3) GPIOLIB=n, ALCHEMY_GPIO_INDIRECT=y:
-*	the boards' gpio.h must provide the linux gpio wrapper functions,
-*
-*(4) GPIOLIB=n, ALCHEMY_GPIO_INDIRECT=n:
-*	inlinable gpio functions are provided which enable access to the
-*	Au1300 gpios only by using the numbers straight out of the data-
-*	sheets.
-
-* Cases 1 and 3 are intended for boards which want to provide their own
-* GPIO namespace and -operations (i.e. for example you have 8 GPIOs
-* which are in part provided by spare Au1300 GPIO pins and in part by
-* an external FPGA but you still want them to be accessible in linux
-* as gpio0-7. The board can of course use the alchemy_gpioX_* functions
-* as required).
-*/
-
-#ifndef CONFIG_GPIOLIB
-
-#ifdef CONFIG_ALCHEMY_GPIOINT_AU1300
-
-#ifndef CONFIG_ALCHEMY_GPIO_INDIRECT	/* case (4) */
-
-static inline int gpio_direction_input(unsigned int gpio)
-{
-	return au1300_gpio_direction_input(gpio);
-}
-
-static inline int gpio_direction_output(unsigned int gpio, int v)
-{
-	return au1300_gpio_direction_output(gpio, v);
-}
-
-static inline int gpio_get_value(unsigned int gpio)
-{
-	return au1300_gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value(unsigned int gpio, int v)
-{
-	au1300_gpio_set_value(gpio, v);
-}
-
-static inline int gpio_get_value_cansleep(unsigned gpio)
-{
-	return gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	gpio_set_value(gpio, value);
-}
-
-static inline int gpio_is_valid(unsigned int gpio)
-{
-	return au1300_gpio_is_valid(gpio);
-}
-
-static inline int gpio_cansleep(unsigned int gpio)
-{
-	return au1300_gpio_cansleep(gpio);
-}
-
-static inline int gpio_to_irq(unsigned int gpio)
-{
-	return au1300_gpio_to_irq(gpio);
-}
-
-static inline int irq_to_gpio(unsigned int irq)
-{
-	return au1300_irq_to_gpio(irq);
-}
-
-static inline int gpio_request(unsigned int gpio, const char *label)
-{
-	return 0;
-}
-
-static inline int gpio_request_one(unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	return 0;
-}
-
-static inline int gpio_request_array(struct gpio *array, size_t num)
-{
-	return 0;
-}
-
-static inline void gpio_free(unsigned gpio)
-{
-}
-
-static inline void gpio_free_array(struct gpio *array, size_t num)
-{
-}
-
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return -ENOSYS;
-}
-
-static inline void gpio_unexport(unsigned gpio)
-{
-}
-
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
-{
-	return -ENOSYS;
-}
-
-static inline int gpio_sysfs_set_active_low(unsigned gpio, int value)
-{
-	return -ENOSYS;
-}
-
-static inline int gpio_export_link(struct device *dev, const char *name,
-				   unsigned gpio)
-{
-	return -ENOSYS;
-}
-
-#endif	/* !CONFIG_ALCHEMY_GPIO_INDIRECT */
-
-#endif	/* CONFIG_ALCHEMY_GPIOINT_AU1300 */
-
-#endif	/* CONFIG GPIOLIB */
-
 #endif /* _GPIO_AU1300_H_ */
-- 
2.16.4

