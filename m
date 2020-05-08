Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0331CB4E5
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 18:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHQWx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 12:22:53 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17491 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726756AbgEHQWx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 May 2020 12:22:53 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588954951; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=pebGk6hsd3YsLzG0W4Jnx0wlWqIDRYYjsneDzu0/78WVpiXtDdbEOGJbxHwsrsz9ajDY58b2D2/6cE6tsTlpvhSZBjTMF6cub0GB6q6yfMQ45OjpHRLlI4oq6aZFuoFoonGYAuazdk9PMo8zWB2F3736FefCiS51Y/hFFw0xRV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588954951; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=Cz58bBGyWKkKJdTIxuW4a8aOuPWzKoBbhuGqr+LTMDU=; 
        b=MWcmVMvkdZW/vAqV0/FJ5iElMbgvN/R6yVV8hJr1Io0mZw0K5DjGDuA/UGp4GKkvuHXPucK6qHEYvl6HT4xvCTGGv8SbGJtQ5HXeN0MU9LJvCiY31iL/iCrvko9kXuiGNes29TPy+puoRWjBP4PXIO9Qc1AyDIeO8FB4qF2W0V0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588954951;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=Cz58bBGyWKkKJdTIxuW4a8aOuPWzKoBbhuGqr+LTMDU=;
        b=BaoBRVgmdc72uD7ucEdzwXukBzrcPf+eYzslfL7V0quPS8v7bwCh/GE1oD5a5v43
        4/0u3cbkgpTCVA2AGfFYK0uOB4tvet8mIQmSOvVJszpj6vQfxcRepzBXMhUcmtpO4w6
        bFFx3DARRomIxrcCGiRyLUziv3Z3/fb5NlpAH41k=
Received: from [127.0.0.1] (114.87.80.20 [114.87.80.20]) by mx.zoho.com.cn
        with SMTPS id 1588954947751654.5132856099553; Sat, 9 May 2020 00:22:27 +0800 (CST)
Date:   Sat, 09 May 2020 00:22:25 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200508161102.GA23094@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-1-jiaxun.yang@flygoat.com> <20200508114438.3092215-2-jiaxun.yang@flygoat.com> <20200508161102.GA23094@alpha.franken.de>
Message-ID: <18B84249-7CA1-411E-B595-6E215D8C9C34@flygoat.com>
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
:11:02, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Fri, May 08, 2020 at 07:44:37PM +0800, Jiaxun Yang wrote:
>> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment=2E
>> That would allow virt address of I/O ports to be dynamicly mapped=2E
>> So we'll be able to combine multiple MMIO ranges into I/O ports
>> and thus we can take advantage of logic_pio mechanism=2E
>
>What is the advantage ?
>
>From my point of view this will be slower because of TLB faults for
>PCI IO space accesses=2E

Advantage is we can use logic_pio to manage multiple I/O Port ranges=2E

That can help us reuse generic PCI I/O design=2E

Thanks=2E

>
>Thomas=2E
>

--=20
Jiaxun Yang
