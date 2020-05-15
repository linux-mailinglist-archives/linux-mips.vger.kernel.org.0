Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6583A1D4805
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgEOIUh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:20:37 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17781 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726723AbgEOIUg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:20:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589530799; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=I5AO7eEHD447CccTdZaAOftVutHbnJp7+oCWupqOjxaFxHumOrHsLsPwTR3WD8F/Tj297dxDZKQZPIbALAPgKB2zjfG4DByeuIl7gn7+lxzrH8tnbGt4ZrzEdf6kQxO0f++bkXRJcNUAd7M4X7rIncAK8Hfh7QqAqqfgnuTBPn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589530799; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=Qx19X+8L49YGzi+rmZOD+1r21r80p24bDOJwkcWDnQI=; 
        b=U2ewBZCKPaMnwsBx1lSJCsv7Bd7+losI2aNQyg6D2v3zBJaN6h9qp5F0yG8ve35TLew9p0JHfU/GeASzsmf026nzi+j54LlnR3E/JZWpW1q3E72veBF1GB1f/YzIL90WkPEZH5pEEpbZ68qZNSIXw53NiEDuV0Ye86tE/97Uu24=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589530799;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=Qx19X+8L49YGzi+rmZOD+1r21r80p24bDOJwkcWDnQI=;
        b=SsP/HvLo7zUc4qavU4jkMM0x7eO0RA1RDj+T0/JmskrpysldtZwG9gqhcSqyCeN5
        VpyiT/WcqRtiT3ybc1kVRtPAsK40ZpbWH4ONgr5aw7Id1sQHxztn4EqOgq6CziIDQ4C
        wfo1YF/8MiOqDAbFIRwUC/V2IqbtLgwgF47uAmLI=
Received: from [127.0.0.1] (101.84.172.108 [101.84.172.108]) by mx.zoho.com.cn
        with SMTPS id 1589530796515656.4604736588635; Fri, 15 May 2020 16:19:56 +0800 (CST)
Date:   Fri, 15 May 2020 16:19:52 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 2/2] MIPS: Fix build errors under CONFIG_HAVE_STD_PC_SERIAL_PORT
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <7715fe64-5d28-f8c8-3b04-0bf2b9f16497@loongson.cn>
References: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn> <1589512985-27419-2-git-send-email-yangtiezhu@loongson.cn> <20200515073938.GA8289@alpha.franken.de> <7715fe64-5d28-f8c8-3b04-0bf2b9f16497@loongson.cn>
Message-ID: <5AA0EB3A-DF33-4BE7-804C-45F6B51A0CF7@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:54:46, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 05/15/2020 03:39 PM, Thomas Bogendoerfer wrote:
>> On Fri, May 15, 2020 at 11:23:05AM +0800, Tiezhu Yang wrote:
>>> When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, include linux/module=2Eh t=
o fix
>>> the following build errors:
>> how are you doing this ? To me it looks like this CONFIG option isn't
>> used anymore=2E
>
>Because I will use arch/mips/kernel/8250-platform=2Ec in the near future,
>so make MACH_LOONGSON64 selects HAVE_STD_PC_SERIAL_PORT, then
>I find the build errors=2E

Please never use it=2E
If you are willing to add serial port then please do it
in devicetree=2E
Platform devices in wild is dangerous and it will break everything=2E

>
>Thanks,
>Tiezhu Yang
>
>>
>> Thomas=2E
>>
>

--=20
Jiaxun Yang
