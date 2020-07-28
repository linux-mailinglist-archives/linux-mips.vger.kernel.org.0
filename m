Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53D7230E23
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 17:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbgG1PkP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 11:40:15 -0400
Received: from crapouillou.net ([89.234.176.41]:56250 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730679AbgG1PkP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 11:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595950813; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mMC+SGhfOG6kBdqyqJA8JPLuqdZi+nfSRRDFEcVdBHM=;
        b=MPkqTD1MumU3JJYRCzS76k8lzdZZzWDIyhMFJavPeu9BtYsaMcbLCwoL5CjmbuVSMS7bZq
        OgQeSTzty/l25SbJyf0j2HdOeBT8elU15tq6kgqifAHX2XLNTpv3McLH09dH1Gu659mUCg
        wxV2zCd9uyulrFo9yUcDWsmHwhfbuTM=
Date:   Tue, 28 Jul 2020 17:40:01 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: CI20: Update defconfig for EFUSE.
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, keescook@chromium.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <PIR6EQ.G22CDHRT7D5O@crapouillou.net>
In-Reply-To: <b1de1e95-9ce3-1324-346d-07196aa30637@wanyeetech.com>
References: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
        <20200723071950.130007-2-zhouyanjie@wanyeetech.com>
        <V2ZWDQ.DNM4EVLAB6YN3@crapouillou.net>
        <b1de1e95-9ce3-1324-346d-07196aa30637@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam. 25 juil. 2020 =C3=A0 16:02, Zhou Yanjie <zhouyanjie@wanyeetech.com>=
=20
a =C3=A9crit :
> Hi Paul,
>=20
> =E5=9C=A8 2020/7/23 =E4=B8=8B=E5=8D=884:47, Paul Cercueil =E5=86=99=E9=81=
=93:
>> Hi Zhou,
>>=20
>> Le jeu. 23 juil. 2020 =C3=A0 15:19, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
>> =7F<zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>> The commit 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
>>> controller use NVMEM to find the default MAC address") add EFUSE
>>> node for DM9000 in CI20, however, the EFUSE driver is not selected,
>>> which will cause the DM9000 to fail to read the MAC address from
>>> EFUSE, causing the following issue:
>>>=20
>>> [FAILED] Failed to start Raise network interfaces.
>>>=20
>>> Fix this problem by select CONFIG_JZ4780_EFUSE by default in the
>>> ci20_defconfig.
>>=20
>> Does it actually fix it on a clean 5.8-rc kernel?
>>=20
>> From what I know, the efuse driver cannot probe, because the nemc=20
>> =7Fdriver requests the complete memory resource, so the efuse driver's=20
>> =7Fdevm_platform_ioremap_resource() fails.
>>=20
>> I did send a patch to fix this=20
>> =7F(https://lore.kernel.org/lkml/551a8560261543c1decb1d4d1671ec4b7fa52fd=
b.1582905653.git.hns@goldelico.com/),
>> but it's hard to have somebody merge it, because nobody maintains=20
>> =7Fdrivers/memory/.
>>=20
> You are right, I cleaned up the changes made to support X1000's EFUSE=20
> and rebase to clean 5.8-RC6, it still does not work properly, I think=20
> we should drop this fix patch.

The patch I mentioned was merged, so starting from 5.9-rc1 the efuse=20
driver should work. Please resend this patch after 5.9-rc1 then.

Thanks,
-Paul

>=20
>>> Fixes: 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
>>> controller use NVMEM to find the default MAC address").
>>=20
>> That shouldn't be a fix IMHO - the devicetree was updated in one=20
>> =7Fcommit, the config should be updated in another. The "bug" here is=20
>> =7Fthat it wasn't done right away.
>>=20
> Okay.
>>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wa=
nyeetech.com>
>>=20
>> Btw - when you add a Fixes: tag to fix a commit that is not for the=20
>> =7Fkernel currently in RC phase, you need to Cc linux-stable as well.
>>=20
> Sure, I will pay attention next time.
>=20
> Thanks and best regards!
>=20
>=20
>> Cheers,
>> -Paul
>>=20
>>> ---
>>>  arch/mips/configs/ci20_defconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/arch/mips/configs/ci20_defconfig=20
>>> =7F=7Fb/arch/mips/configs/ci20_defconfig
>>> index f433fad16073..ba26ba4de09a 100644
>>> --- a/arch/mips/configs/ci20_defconfig
>>> +++ b/arch/mips/configs/ci20_defconfig
>>> @@ -140,6 +140,7 @@ CONFIG_INGENIC_OST=3Dy
>>>  CONFIG_MEMORY=3Dy
>>>  CONFIG_PWM=3Dy
>>>  CONFIG_PWM_JZ4740=3Dm
>>> +CONFIG_JZ4780_EFUSE=3Dy
>>>  CONFIG_EXT4_FS=3Dy
>>>  # CONFIG_DNOTIFY is not set
>>>  CONFIG_AUTOFS_FS=3Dy
>>> --
>>> 2.11.0
>>>=20
>>=20


