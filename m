Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29EC24E79C
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 15:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgHVNSD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Aug 2020 09:18:03 -0400
Received: from crapouillou.net ([89.234.176.41]:33100 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727936AbgHVNSC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Aug 2020 09:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598102280; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4HMc1bAlqxjLY0caVMFS7c2Dub0R07mbOwtzpAcZugY=;
        b=AAedyF8nqEUuvwcMWGUZ8v6H7z14p0wZnPPhVfHtNYpnbASXvlQZ3bvpmr7kMdK0r2dnw8
        /4hQfbjynPLB3w2/u0ttQob6UuOAOpnwE/sraaGZRBWQLJlxbrVML8TGVmC1HEXg5+jLqT
        r+6EJOAqvb4VN36p23fh6mUVGhjw8TI=
Date:   Sat, 22 Aug 2020 15:17:49 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?b?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
Message-Id: <PLVGFQ.TBOPD0BSHD5L1@crapouillou.net>
In-Reply-To: <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org>
References: <20200803170124.231110-1-paul@crapouillou.net>
        <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
        <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>
        <alpine.LFD.2.21.2008211949220.3460685@eddie.linux-mips.org>
        <4SSFFQ.3I498N5I41LP3@crapouillou.net>
        <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le sam. 22 ao=FBt 2020 =E0 3:29, Maciej W. Rozycki <macro@linux-mips.org>=20
a =E9crit :
> Hi Paul,
>=20
>>  > FAOD <cpu-feature-overrides.h> is not a hack, but an optimisation=20
>> measure
>>  > so that features known to be hardwired for a given machine/CPU do=20
>> not have
>>  > to be dynamically queried every time referred.  In some cases=20
>> that results
>>  > in large portions of code being optimised away by the compiler as=20
>> well.
>>=20
>>  Fair enough. Bloat-o-meter reports about ~100 KiB saved when that=20
>> file is
>>  present. But we can't use it in a generic kernel, unfortunately.
>=20
>  Well, run-time patching might be an alternative to get the best of=20
> both
> worlds, but someone would have to reimplement our feature selection=20
> system
> to use it.

Would run-time patching allow to drop dead code?

>>  > The hardcoded value for a feature defined in=20
>> <cpu-feature-overrides.h>
>>  > always has to be the same as one in the corresponding bit of the=20
>> `options'
>>  > member of `struct cpuinfo_mips', in this case MIPS_CPU_TLBINV.
>>=20
>>  In theory yes, in practice the CPU detection code is lagging=20
>> behind...
>=20
>  I wasn't aware of that.  In that case it has been a design abuse=20
> which
> has been missed by the maintainer when accepting patches.  It used to=20
> be
> the case that run-time detection was accurate and overrides were=20
> rather
> lazily added.
>=20
>  Also I note Ingenic must have had a CPU erratum if our=20
> `decode_configs'
> doesn't just work, as the interpretation of CP0.Config[5:0] registers=20
> has
> been architectural and mandatory, and that for a reason.  It's only=20
> legacy
> MIPS I-IV processors that should require special attention here.

Yes, Ingenic CPUs have a few bloopers here and there...

-Paul


