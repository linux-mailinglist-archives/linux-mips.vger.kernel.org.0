Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DFC1BA1E4
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 13:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD0LFy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 07:05:54 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17794 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgD0LFy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 07:05:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587985428; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=jvlgkNg+Hi5GA+aRS4w7bcwPWkHxzoXapKmBTQ30pDBzxrqVMbLRYk+/CVOBIxk46FFalYiAmfPPmMiN+2aFhViqf5RdeXYRRUHPSTbzUPs+wskvo0VjC+p/PbjPsE2IUI8ZorZsxfvAUDRLKCOOwJ6AGU2KaqNpD4izKIAp67s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587985428; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=uqWai94iDA2ATC9yAqYojNIDFCeGKFzxWGb1697+ko0=; 
        b=C8qiQVvWRHk9DUk9Gqj0aITm5xLGjlxyaDvqgu5QpuHEtvWYohCVRhZ2xHBXFChl3KfnqrqdZBoUO9whx6ZoqsHgYp5iXd+DPROKIGijfTB6IF7HzbqR2x4uvuiUInF8G9B7qdBME45vGtWbhH85AkqwK/PZ3nxJlMwPXQz+m6A=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587985428;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=uqWai94iDA2ATC9yAqYojNIDFCeGKFzxWGb1697+ko0=;
        b=Xq0NFfpdw0D67d5vPqunFsxKR9cSbo4YdwaCDNPitmWnM5j4mN27sarKA6eTUTqL
        acUB+CWwjXMB1hJof/q3/r/4gdHIy+3CX274/obsSk6PAvXwydMZYs1RtQesGy/tOcG
        MfvxOYqh6ZS3EJ5gMk5njZhkbD77OB8jpmCrfVtU=
Received: from [127.0.0.1] (122.235.213.3 [122.235.213.3]) by mx.zoho.com.cn
        with SMTPS id 158798542576895.68244044207586; Mon, 27 Apr 2020 19:03:45 +0800 (CST)
Date:   Mon, 27 Apr 2020 19:03:40 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     John Garry <john.garry@huawei.com>, linux-mips@vger.kernel.org
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Linuxarm <linuxarm@huawei.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] lib: logic_pio: Introduce MMIO_LOWER_RESERVED
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <e84f4146-b44f-b009-0dc4-876aa551f44f@huawei.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com> <20200426114806.1176629-4-jiaxun.yang@flygoat.com> <e84f4146-b44f-b009-0dc4-876aa551f44f@huawei.com>
Message-ID: <42432F7C-D859-48B4-9547-A61BD22EFEEF@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886=
:43:09, John Garry <john=2Egarry@huawei=2Ecom> =E5=86=99=E5=88=B0:
>On 26/04/2020 12:47, Jiaxun Yang wrote:
>> That would allow platforms reserve some lower address in PIO MMIO range
>> to deal with legacy drivers with hardcoded I/O ports that can't be
>> managed by logic_pio=2E
>
>Hi,
>
>Is there some reason why the logic_pio code cannot be improved to handle=
=20
>these devices at these "fixed" addresses? Or do you have a plan to=20
>improve it? We already support fixed bus address devices in the INDIRECT=
=20
>IO region=2E

Hi,

The issue about "Fixed Address" is we can't control the ioport
That driver used to operate devices=2E
So any attempt to resolve it in logic_pio seems impossible=2E

Currently we have i8259, i8042, piix4_smbus, mc146818 rely on this assumpt=
ion=2E

My plan is after getting this part merged, I'm going to work on a ISA Host=
 bridge driver,
then convert device drivers into logic_pio and Devicetree based driver ste=
p by step=2E

Finally when we nologner have any legacy driver, we can safely remove this=
 reserved
range=2E

Thanks=2E


>
>Carving out a region of IO space is less than ideal=2E
>
>Thanks,
>John
>
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> ---
>>   lib/logic_pio=2Ec | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/lib/logic_pio=2Ec b/lib/logic_pio=2Ec
>> index f511a99bb389=2E=2E57fff1cb7063 100644
>> --- a/lib/logic_pio=2Ec
>> +++ b/lib/logic_pio=2Ec
>> @@ -20,6 +20,10 @@
>>   static LIST_HEAD(io_range_list);
>>   static DEFINE_MUTEX(io_range_mutex);
>>  =20
>> +#ifndef MMIO_LOWER_RESERVED
>> +#define MMIO_LOWER_RESERVED	0
>> +#endif
>> +
>>   /* Consider a kernel general helper for this */
>>   #define in_range(b, first, len)        ((b) >=3D (first) && (b) < (fi=
rst) + (len))
>>  =20
>> @@ -36,7 +40,7 @@ int logic_pio_register_range(struct logic_pio_hwaddr =
*new_range)
>>   	struct logic_pio_hwaddr *range;
>>   	resource_size_t start;
>>   	resource_size_t end;
>> -	resource_size_t mmio_end =3D 0;
>> +	resource_size_t mmio_end =3D MMIO_LOWER_RESERVED;
>>   	resource_size_t iio_sz =3D MMIO_UPPER_LIMIT;
>>   	int ret =3D 0;
>>  =20
>>=20
>

--=20
Jiaxun Yang
