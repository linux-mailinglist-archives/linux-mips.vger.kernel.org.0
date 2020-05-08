Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECE31CB566
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 19:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgEHRJk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 13:09:40 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17433 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726750AbgEHRJk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 May 2020 13:09:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588957754; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=fqEoqUf0PgWXU0RE6UryaKSw4LtWmH6cqXMkqzMN9f52iwlKTWGinO4BUZ42Cr2DY33vianu+i9d3v5N4Q6CIy9z68Rb3hHX13IN9l9AVsxvztaKWYCqSKbvj9x1sFo5n0i2Du55wrTCj133RXtPy+iDH/OAsDX/8ssD61y0txg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588957754; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=sn8PsjUjosh2dcQ9XMRUWZ5Tf1Q5eCLPCHijiKQMpZY=; 
        b=pjGcAjV1T6Kpfa+LRUO/PG2baRpkEinnMSft1lLiSR7OcHafR+RrVsfmIjAczI0ib/zrhiMFUknl8xbQbu5EpynBORPBTaUoMWbKV4IeZtkEj0su94GUa8mTeE4KQwIwns3Z6XnyFeOtYtruR+WBe1kZhfnZd9bw7+QuT3UAeKM=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588957754;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=sn8PsjUjosh2dcQ9XMRUWZ5Tf1Q5eCLPCHijiKQMpZY=;
        b=N0/tvKSrMZ0LAeXnq13orL7EO37ZzhfA90UqGAsNdUGGUo9RVcHSgkOW+DnHJ2Qt
        IanGIC/abiOUlAW+nj2F2aMklbAC4bEr+kFsNuTC0kIMssIDgNNhubrylLnIVgD5Hiy
        tife44z/Z9MqwYI1n1/5N5nEotdQC3bKx9/c2Wg0=
Received: from [127.0.0.1] (114.87.80.20 [114.87.80.20]) by mx.zoho.com.cn
        with SMTPS id 1588957750148960.5302208067562; Sat, 9 May 2020 01:09:10 +0800 (CST)
Date:   Sat, 09 May 2020 01:09:07 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200508165235.GA24425@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-2-jiaxun.yang@flygoat.com> <20200508161102.GA23094@alpha.franken.de> <18B84249-7CA1-411E-B595-6E215D8C9C34@flygoat.com> <20200508165235.GA24425@alpha.franken.de>
Message-ID: <928CB1C1-9852-4CEA-8B3E-E5EAB23E4A0B@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8812=
:52:35, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Sat, May 09, 2020 at 12:22:25AM +0800, Jiaxun Yang wrote:
>>=20
>>=20
>> =E4=BA=8E 2020=E5=B9=B45=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:11:02, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=
=E5=88=B0:
>> >On Fri, May 08, 2020 at 07:44:37PM +0800, Jiaxun Yang wrote:
>> >> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment=2E
>> >> That would allow virt address of I/O ports to be dynamicly mapped=2E
>> >> So we'll be able to combine multiple MMIO ranges into I/O ports
>> >> and thus we can take advantage of logic_pio mechanism=2E
>> >
>> >What is the advantage ?
>> >
>> >From my point of view this will be slower because of TLB faults for
>> >PCI IO space accesses=2E
>>=20
>> Advantage is we can use logic_pio to manage multiple I/O Port ranges=2E
>
>and what exactly does this buy us ? I looked at lib/logic_pio=2Ec and
>there didn't appear anything in my mind other than yet another
>interface for doing the same thing=2E=2E=2E

With Logic_PIO subsystem, each I/O region will be registered
in logic_pio and being mapped in TLB, that means I/O regions can l
be sparsely layouted in MMIO=2E

And device drivers are accessing in*/out* functions via ioport allocated b=
y
logic_pio instead of the physical I/O ports=2E

That will allow multiple I/O port region exist in a system=2E

>
>> That can help us reuse generic PCI I/O design=2E
>
>please explain this=2E

Generic PCI code are handling MMIO I/O ports via logic_pio,
it will register a logic_pio range for each Host Bridge's MMIO I/O ports=
=2E

Thanks=2E

>
>Thomas=2E
>

--=20
Jiaxun Yang
