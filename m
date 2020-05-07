Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA77F1C8AB2
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 14:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgEGM1L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 08:27:11 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:27921 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgEGM1L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 08:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1588854430; x=1620390430;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=ruHbs8OphldTb9zAFBs088ywb6jMJotnXOFlJJIRTSw=;
  b=qD+tqV3ihii0yTxZh74rATFd9oI4Ygu/pNPXNcHY3CSiKkyS39vYMZXh
   FP+qx9hfqk5u1lVVWcp5qJPVGMLuwdEGqZjPrhMWJZi5yP6FUawKf8Gmh
   HqokWXpBTQrEpDHb1NppHO6AfgX3c2qDY+e/foiIMqYZOvX7WPW61WAw+
   18p8tBMGMTuBSf63nIKMDbkS9j2lEgSoGVvjBlzTygFbwDE14pgmPMmG5
   REa3PGww95nz3r0pKaZsC71YVKi58aRJ5ZatEQ12GZ4K9NmLSZeMDNUPo
   vCXLWgqeeI68EtSkiyk1VOPtK55W+nmadWHoh4WyGrsMCX5F6szNM+0cx
   Q==;
IronPort-SDR: J0LVxm5et4oh3TW3cCuLHDK3Kg7J2DrBQxaNy2/dPei5d+iG4elNniRmpstgatZv8iNXoMIRgd
 ookt9yXgarFpsB0isOmjM6A8rz9+tjbNdtboXeRm8TzcZe282L9gux6geJa5l0NLJ6yIO4V03S
 +tdATYjaan0zG2zuAhtlI1ZVguybNJ+2SMHwXc/XF4CTrSjj3J/5apM/jZxKPpYPIfNirZJwI+
 J9uoGVpsMQT6izdiH8+YJNedN6kf4V2uSd014rIUI8QS37RiOAWk4wiNulW0/oAY2TQvtl/TXL
 E2o=
X-IronPort-AV: E=Sophos;i="5.73,363,1583218800"; 
   d="scan'208";a="11636031"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 May 2020 05:27:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 7 May 2020 05:27:12 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 7 May 2020 05:27:09 -0700
References: <20200507114015.24461-1-geert+renesas@glider.be> <20200507114525.GE34497@piout.net>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Microchip Linux Driver Support" <UNGLinuxDriver@microchip.com>,
        <linux-gpio@vger.kernel.org>, <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
In-Reply-To: <20200507114525.GE34497@piout.net>
Date:   Thu, 7 May 2020 14:27:06 +0200
Message-ID: <87ftccorqd.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Alexandre Belloni writes:

> Hi,
>
> On 07/05/2020 13:40:15+0200, Geert Uytterhoeven wrote:
>> The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
>> and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
>> config symbol, to avoid asking the user about it when configuring a
>> kernel without Ocelot or Jaguar2 support.
>>
>
> I have to NAK here because there are upcoming (hopefully this cycle)
> SoCs using this driver.
>

Not only because of that, but also an arbitrary system connecting to
ocelot by PCI could be using the driver.

>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/pinctrl/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> index f0ce4ce3e0f52456..bed67c08a0892240 100644
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -394,8 +394,8 @@ config PINCTRL_RK805
>>
>>  config PINCTRL_OCELOT
>>       bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
>> -     depends on OF
>> -     depends on HAS_IOMEM
>> +     depends on OF && HAS_IOMEM
>> +     depends on MSCC_OCELOT || COMPILE_TEST
>>       select GPIOLIB
>>       select GPIOLIB_IRQCHIP
>>       select GENERIC_PINCONF
>> --
>> 2.17.1
>>

-- 
Lars Povlsen,
Microchip
