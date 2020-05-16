Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B414F1D5F58
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 09:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgEPHRY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 03:17:24 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17785 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725807AbgEPHRY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 03:17:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589613403; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Gx1m+RSTYF08xlcc5sJefHNltDRzMnGnkxpsTnXHkU89ZGD3ePPU6KsO0XciPTK/dT78+5ZHBPwFdck+2k7I/aLh0V+zztYVDY4sGjRNJ19YrCpImlrpqFJ2NK+FnJRD8k6PbEg8byKFXC15n5deA6N/jH3CXl4/VX/CdPWoxQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589613403; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=icecfiXkkDsRqhn5m2sHi0QsuxMPAJI9JuFBm6LuO64=; 
        b=RsqpzzvBfjuBQTiXCMGU791Fyce+cvQgQIl7kYGwpYscU/aFdyJ2q1NGfcqcDAHT0pi0ggHoIIjPLnXKSrTZYqH7ImvR+fIwiQ1NLUpFLWqtXlB/W+a5v/dHvCoCmE4CFXNKreDBmkAulngy6XD7bg9JsXaZmrDv9ltMUeZLENI=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589613403;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=icecfiXkkDsRqhn5m2sHi0QsuxMPAJI9JuFBm6LuO64=;
        b=aKdbcVTIg77LiBJDYoC5dyh1+HfEzQOx7cMI4IrjqH8DIuCtM6b7Yw/r3eSr6Nj+
        o0ckXO1PI8iqa9p7+mDBaYqXPazN8yORlc59qlU6HYkILiQUwNnbEK+CaT5jZ+T4Uof
        3w1YBIdK8nIN/9x9bZyFfYxh1feJjRiWk9TFgjUI=
Received: from [127.0.0.1] (223.104.212.75 [223.104.212.75]) by mx.zoho.com.cn
        with SMTPS id 1589613400205894.5480665644669; Sat, 16 May 2020 15:16:40 +0800 (CST)
Date:   Sat, 16 May 2020 15:16:36 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Add support for serial console
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <41961321-A428-42BF-ADDB-C2ACBBE25E4E@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8816=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:03:08, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
>there already exists the node and property of Loongson CPU UART0
>in loongson3-package=2Edtsi:
>
>cpu_uart0: serial@1fe001e0 {
>        compatible =3D "ns16550a";
>        reg =3D <0 0x1fe001e0 0x8>;
>        clock-frequency =3D <33000000>;
>        interrupt-parent =3D <&liointc>;
>        interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
>        no-loopback-test;
>};
>
>In order to support for serial console on the Loongson platform,
>add CONFIG_SERIAL_OF_PLATFORM=3Dy to loongson3_defconfig=2E
>
>With this patch, we can see the following boot message:
>
>[    1=2E877745] printk: console [ttyS0] disabled
>[    1=2E881979] 1fe001e0=2Eserial: ttyS0 at MMIO 0x1fe001e0 (irq =3D 16,=
 base_baud =3D 2062500) is a 16550A
>[    1=2E890838] printk: console [ttyS0] enabled
>
>And also, we can login normally from the serial console=2E
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
>
>Hi Jiaxun,
>
>Thank you very much for your suggestion=2E

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

Looks like we need a Kconfig clean up=2E
I'll do that after getting LS7A PCH support merged=2E

Anyway, thanks for catching this=2E

[=2E=2E=2E]
--=20
Jiaxun Yang
