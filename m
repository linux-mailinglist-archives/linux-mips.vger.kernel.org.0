Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB461C3335
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 08:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgEDG7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 02:59:20 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17449 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbgEDG7T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 02:59:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588575546; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=UlYoASfp/V2/zqiEgbzqFWa7P/ksXcgk3/9DpggZT4ywPi2YDkFunPLZfclc78XCSSJloV+YIMUEJJ0PE9KT/PfPTT0Q6n2gNAke3geRJ1LjLuT7eianrivUz+1HkH6JNrxjXJB6/Qh+nr0aX51CU92d/y7YBqHgyA2e+ABtamo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588575546; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=8z79GHIjzD0YzRKX5zVspQnx5gMkgK0Nh6yJjQNLCUg=; 
        b=NAHRA1qugoFYNBf9aCq9VTpHC6Oby3rRuxuedU7DOQxJmq9hkx6fPylFihvri0loh2G1wCRe7M+l1OpxeMck6ipQWc1/SeAG3v65OZmTyKhtpRl3JA7XZJSNUKizEJHv8fAFj9KYiOh5WD/thmw7xBHLGBmVktlDKkraNnwmJ5Y=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588575546;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=8z79GHIjzD0YzRKX5zVspQnx5gMkgK0Nh6yJjQNLCUg=;
        b=CmXsa+BoOJGuBmLWEd3Bme8myA9y/TJJaZtc65WQ3pqm8Mp4o/PgwGxxycQW17Xu
        GBLWqWoaWObaluuhS0mgiV/fr7eBf4lUlcl6CDc0mG2vRPwXDC+LJN0oUWU66YFbtk4
        GgnQ4OC1PxUzFrzr0Z+s1u7g5oDs7RAPJG2JgXgs=
Received: from [127.0.0.1] (122.235.211.112 [122.235.211.112]) by mx.zoho.com.cn
        with SMTPS id 1588575541091975.5703272994737; Mon, 4 May 2020 14:59:01 +0800 (CST)
Date:   Mon, 04 May 2020 14:58:56 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     WANG Xuerui <kernel@xen0n.name>, linux-mips@vger.kernel.org
CC:     Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <f8eb83b8-7ec3-5d5c-7f4c-c78f72c04c1a@xen0n.name>
References: <20200503103304.40678-5-git@xen0n.name> <20200503105012.43246-1-git@xen0n.name> <3B0FE747-AE18-404B-9CD3-D3401634340C@flygoat.com> <f8eb83b8-7ec3-5d5c-7f4c-c78f72c04c1a@xen0n.name>
Message-ID: <75281384-B289-444B-8FEE-A2F45957D495@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881:=
25:00, WANG Xuerui <kernel@xen0n=2Ename> =E5=86=99=E5=88=B0:
>On 5/3/20 11:50 PM, Jiaxun Yang wrote:
>
>> Some random thoughts on that:
>>
>> While cpucfg instruction would not be available on other MIPS
>> processors, and given that most distros are more willing to provide
>> general MIPS version instead of Loongson specified version, we'd better
>> provide user space programs a way to probe emulated/physical cpucfg sup=
port=2E
>>
>> Looks like elf_hwcap would be a option? I've already added some flags a=
bout
>> Loongson's extension and now an extra HWCAP_LOONGSON_CPUCFG can cover e=
verything=2E
>
>All emulated outputs from the older models have the LCSRP bit clear in=20
>this patch=2E As CPUCFG is part of the Loongson CSR ASE, this is the=20
>reliable way to distinguish between emulated and physical CPUCFG support=
=2E
>
>However, because detecting presence of CPUCFG itself still requires one=
=20
>to handle SIGILL, exposing an hwcap might be an option=2E So we'll have=
=20
>the following mapping:
>
>- no HWCAP_LOONGSON_CPUCFG -- other MIPS or Loongson-2EF or Loongson-32
>- CPUCFG=2E0x2=2ELCSRP =3D=3D 0 -- older Loongson-64 models
>- otherwise, Loongson-3A R4 or later
>
>Seems some of the previously defined hwcaps will become unnecessary if=20
>we make this change=2E But they're already part of kernel ABI so we have=
=20
>to keep them, fortunately we still have plenty of bits available=2E At=20
>least future additions of Loongson features wouldn't go through hwcap=2E
>
>I think the hwcap addition can be added in another follow-up series if=20
>the idea gets consensus; let's keep this series focused=2E

Yeah that's exactly my point=2E

I'm looking forward for getting these stuff merged=2E

Thanks=2E

>

--=20
Jiaxun Yang
