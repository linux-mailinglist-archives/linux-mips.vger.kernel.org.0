Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12E1274745
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 19:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgIVRMB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 13:12:01 -0400
Received: from crapouillou.net ([89.234.176.41]:52486 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgIVRMB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 13:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600794718; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r/cBwbH6F21bf+CzYpi3RQBt3loDuzCrOh9FPh+DK/Q=;
        b=oDbemLGwAvHDecTmpDqn1e6akkMxbQwF+Iu1nIT8sfm2lVcX0J9JuWAFVjEt2iZAykvcYw
        Eu9Y9tfGKqEwZwhn1tB6sMmX0Orcebf8p0dmtdaFkMBvoLuBAC9b0DSohykikcW5LBpNHN
        R6L1tbO1XvxUqyULygMJKfhq7Yl0QcQ=
Date:   Tue, 22 Sep 2020 19:11:48 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: Increase range of CONFIG_FORCE_MAX_ZONEORDER
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <O3L2HQ.37Y7OUPZFQDO1@crapouillou.net>
In-Reply-To: <20200922160218.GA10358@alpha.franken.de>
References: <20200917133528.83091-1-paul@crapouillou.net>
        <20200922160218.GA10358@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le mar. 22 sept. 2020 =E0 18:02, Thomas Bogendoerfer=20
<tsbogend@alpha.franken.de> a =E9crit :
> On Thu, Sep 17, 2020 at 03:35:28PM +0200, Paul Cercueil wrote:
>>  There is nothing that prevents us from using lower maximum values.
>>  It's something that we actually want, when using bigger page sizes=20
>> on
>>  devices with low RAM.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>>  diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>  index 632fe8fe68c4..dca2bbdbfc24 100644
>>  --- a/arch/mips/Kconfig
>>  +++ b/arch/mips/Kconfig
>>  @@ -2251,7 +2251,7 @@ config FORCE_MAX_ZONEORDER
>>   	default "13" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_32KB
>>   	range 12 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
>>   	default "12" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
>>  -	range 11 64
>>  +	range 0 64
>=20
> Do we need the range at all ? Most other archs don't use a range...

The maximum contiguous block size cannot be lower than a huge page, so=20
that's why the 'range' are here.

Which makes me think that there should probably be a "range 11 64 if=20
MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_8KB" and the same for 4KB pages.

With a lower value and huge pages enabled in the config, the kernel=20
probably would not boot.

Cheers,
-Paul


