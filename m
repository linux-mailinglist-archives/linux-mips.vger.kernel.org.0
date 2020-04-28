Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDB31BBCCA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgD1Lr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 07:47:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17785 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726285AbgD1Lr2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 07:47:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588074324; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Xy05zNdC3MFMTfkdoaLrwqTqpQBIgwI9ImssanrOfNLkxVEA/nmxFSnj7yLyy1tfzqCH43Y34FyEYic4RcNV+KaWwtTe/eY0MceyqguhCK1j8fmnsvOTE42FqjRBA7C5909DnqrcXNoy9D8UumGB8HP+qTM4FsBhIay6fwndL/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588074324; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=oG6pqFzQBk7AZlpEQUBQ9MQBZPeiSbtQQkXAin2JXtI=; 
        b=hl6tWzB3WZ1FBp0Yp5tYffyBvUD0Te0mEkJ2JeP3TroEjCEWGBQqaUfY5o/jSi4vtmbOq+rxypyZFjNdXmrokDdBVTShxMuDPcA/AHWU/Asi7ZxuoRhsp1YkO30Pzimx6uYSGCcVfXLO1k9A/40VlFJpYiWPsTAc8I7e6/pj1D0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588074324;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=oG6pqFzQBk7AZlpEQUBQ9MQBZPeiSbtQQkXAin2JXtI=;
        b=E0S6TZ7fSBmVIEvUgzmNXSi4iqSvKuoSBxTbI7vwK6nMIo6qKX8y88upSlFj9mLy
        ltaqKpD3dN3mIZi29QlAvWGbkC44/Yq8KFsd8I/hG620lgzo0jglDx3bis50JbW6N1/
        qzUbOBFK85aiFj5AYjup0zNjJug0s0K5+9A9unzY=
Received: from [127.0.0.1] (122.235.213.3 [122.235.213.3]) by mx.zoho.com.cn
        with SMTPS id 1588074322203701.7412192540986; Tue, 28 Apr 2020 19:45:22 +0800 (CST)
Date:   Tue, 28 Apr 2020 19:45:19 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, john.garry@huawei.com,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] MIPS: Massage address spaces headers
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200428113326.GD11443@alpha.franken.de>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com> <20200428021437.2000066-2-jiaxun.yang@flygoat.com> <20200428113326.GD11443@alpha.franken.de>
Message-ID: <7613695F-5A83-4B57-A2E6-0EE27DCF397F@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=887=
:33:26, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Tue, Apr 28, 2020 at 10:14:12AM +0800, Jiaxun Yang wrote:
>> That would allow us modify kernel vm address spaces without
>> step into the hell of includes=2E
>>=20
>> Also use some marcos for address spaces to make spaces=2Eh more
>> clear=2E
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>
>I don't like this patch as I can't see a good reason for shuffling
>stuff arround=2E Can you drop this from this series ?

The problem is without this patch we'll have to include pgtable-32=2Eh and
pgtable-64=2Eh into asm/io=2Eh, and that will become totally hell=2E

Thanks=2E

>
>Thomas=2E
>

--=20
Jiaxun Yang
