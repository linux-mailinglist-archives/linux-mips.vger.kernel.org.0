Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAD622AB04
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 10:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGWIrc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 04:47:32 -0400
Received: from crapouillou.net ([89.234.176.41]:49292 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgGWIrc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Jul 2020 04:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595494049; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BJyfUllChIJgl3yWHH+VMxuxZEFa7sPXy1SOnwf3Pt4=;
        b=Ros5dEWjjJCrQhTRWWVuUyzRz3LlpkLkaixY68lKRGVFZWFYvozbVecWEyiF9JYTzGmZKz
        PacFl0//rw26fdYt/0FLkmxl/WBbJbnQmr+71uYxBq7uY35tCl1iYJg5m0ofToxYCIRudr
        zAcupG8KxIbbZxoIcav3GKoLb3nza7k=
Date:   Thu, 23 Jul 2020 10:47:19 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: CI20: Update defconfig for EFUSE.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, keescook@chromium.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <V2ZWDQ.DNM4EVLAB6YN3@crapouillou.net>
In-Reply-To: <20200723071950.130007-2-zhouyanjie@wanyeetech.com>
References: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
        <20200723071950.130007-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu. 23 juil. 2020 =C3=A0 15:19, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanji=
e)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> The commit 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
> controller use NVMEM to find the default MAC address") add EFUSE
> node for DM9000 in CI20, however, the EFUSE driver is not selected,
> which will cause the DM9000 to fail to read the MAC address from
> EFUSE, causing the following issue:
>=20
> [FAILED] Failed to start Raise network interfaces.
>=20
> Fix this problem by select CONFIG_JZ4780_EFUSE by default in the
> ci20_defconfig.

Does it actually fix it on a clean 5.8-rc kernel?

 From what I know, the efuse driver cannot probe, because the nemc=20
driver requests the complete memory resource, so the efuse driver's=20
devm_platform_ioremap_resource() fails.

I did send a patch to fix this=20
(https://lore.kernel.org/lkml/551a8560261543c1decb1d4d1671ec4b7fa52fdb.1582=
905653.git.hns@goldelico.com/),
but it's hard to have somebody merge it, because nobody maintains=20
drivers/memory/.

> Fixes: 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
> controller use NVMEM to find the default MAC address").

That shouldn't be a fix IMHO - the devicetree was updated in one=20
commit, the config should be updated in another. The "bug" here is that=20
it wasn't done right away.

> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Btw - when you add a Fixes: tag to fix a commit that is not for the=20
kernel currently in RC phase, you need to Cc linux-stable as well.

Cheers,
-Paul

> ---
>  arch/mips/configs/ci20_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/mips/configs/ci20_defconfig=20
> b/arch/mips/configs/ci20_defconfig
> index f433fad16073..ba26ba4de09a 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -140,6 +140,7 @@ CONFIG_INGENIC_OST=3Dy
>  CONFIG_MEMORY=3Dy
>  CONFIG_PWM=3Dy
>  CONFIG_PWM_JZ4740=3Dm
> +CONFIG_JZ4780_EFUSE=3Dy
>  CONFIG_EXT4_FS=3Dy
>  # CONFIG_DNOTIFY is not set
>  CONFIG_AUTOFS_FS=3Dy
> --
> 2.11.0
>=20


