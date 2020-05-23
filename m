Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE421DF42E
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 04:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387481AbgEWCbL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 22:31:11 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17472 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387427AbgEWCbL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 22:31:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590201059; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=jnCV4gUySMsZTTdmhVTcIPnrBJLwE3+WuNRfTLy+V/9QgzoYLXqDGige9Su/euRAdvLyvCgZzfYFkSdWFS4tgu6dINg2iHBnKn0Bu+Lg8ea5WYzacmHxffb9YjpLzpnomkXZI44vUipYE7/Gp7safvrtU63ROXlhxi0371dRPks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590201059; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=HGGeNhwxCAnYWhxLN6Ce1AAflXIZBD64LHk09NnRnnQ=; 
        b=iKXv3ToLOjhbHXyyYxPJ7T3z2iEFr97KqDN8CuDFtI76YTU6roSO8imScb9wWsJc/KK+WkafQ8LVKczdxMvenrEx5HMqm9tHhYOM4KZay05SV20hxvgNU1LNQeZJ10iavXXEer5Od9H+v3g7obH2F12d3LCMmIekRyX0b2Qr1jw=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590201059;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=HGGeNhwxCAnYWhxLN6Ce1AAflXIZBD64LHk09NnRnnQ=;
        b=YCIL8f5tuHTls9o5P9ImbCTyXkX3luKCJo1OPrOvpx91bRmC9ZPcO43/kr4wdUrP
        J2MMJq/PZ1lPHziAKEdPMswR5TQpQFzWg2OG5z46AtqRQt6i64axjIwFLqtXSGmbIlq
        J25+Vr1wLjgp7v/7k52wQyqNRz20rtPgt5I4sSeI=
Received: from [127.0.0.1] (60.177.188.90 [60.177.188.90]) by mx.zoho.com.cn
        with SMTPS id 1590201057218793.839581616559; Sat, 23 May 2020 10:30:57 +0800 (CST)
Date:   Sat, 23 May 2020 10:30:55 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maobibo <maobibo@loongson.cn>
CC:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <bedfcdc3-ae99-2920-c08e-94a269406d80@loongson.cn>
References: <20200521181403.6078-1-git@xen0n.name> <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn> <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com> <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn> <50F35B43-9313-4083-A98F-45FCA3F516E2@flygoat.com> <bedfcdc3-ae99-2920-c08e-94a269406d80@loongson.cn>
Message-ID: <BA7D0273-E616-458A-BEBD-FA46A34B8AA4@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:10:16, maobibo <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>
>On 05/22/2020 10:34 PM, Jiaxun Yang wrote:
>>=20
>>=20
>> =E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8810:14:02, "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@loongson=2Ecn> =E5=86=
=99=E5=88=B0:
>>>
>>>
>>>
>>> &gt; -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
>>> &gt; =E5=8F=91=E4=BB=B6=E4=BA=BA: "Jiaxun Yang" <jiaxun=2Eyang@flygoat=
=2Ecom>
>>> &gt; =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2020-05-22 20:57:33 (=E6=98=
=9F=E6=9C=9F=E4=BA=94)
>>> &gt; =E6=94=B6=E4=BB=B6=E4=BA=BA: "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobi=
bo@loongson=2Ecn>, "WANG Xuerui" <git@xen0n=2Ename>
>>> &gt; =E6=8A=84=E9=80=81: linux-mips@vger=2Ekernel=2Eorg
>>> &gt; =E4=B8=BB=E9=A2=98: Re: [PATCH v3 0/1] CPUCFG emulation on older =
Loongson64 cores
>>> &gt;=20
>>> &gt;=20
>>> &gt;=20
>>> &gt; =E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=
=E5=8D=888:06:01, "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@loongson=2Ecn> =E5=
=86=99=E5=88=B0:
>>> &gt; &gt;Sorry for late reponse=2E
>>> &gt; &gt;I just want to know how to solve compatibility on older kerne=
l=2E
>>> &gt; &gt;It is ok to run user application with cpucfg instr on new ker=
nel with this
>>> &gt; &gt;patch, however what if the application is running on older ke=
rnel without
>>> &gt; &gt;cpucfg simulation?
>>> &gt;=20
>>> &gt; Application can firstly probe if CPUCFG is supported by kernel &a=
mp; hardware
>>> &gt; by fork a thread and catch SIGILL signal or HWCAP=2E
>>> &gt; Then decide use legacy methods or CPUCFG to probe other features=
=2E
>>> &gt;=20
>>> &gt; Similar method have been proofed on Arm=2E
>>> Sure, if  that works, what is the purpose of this patch? Do we need cp=
ucfg
>>> simulation on older machine since there is proper method already?
>>=20
>> Because it's more efficient and elegant=2E
>> Also applications can assume systems without CPUCFG have
>> no Loongson extension support=2E
>> That can save hundreds lines in various applications=2E
>You can add add this to hwcap/cpuinfo though it is difficult to add vendo=
r specific
>hwcap=2E Application can check hwcap and then use cpucfg gracefully=2E=20
>
>I do not see usage of cpucfg simulation on older machine, do we add new i=
nstruction emulation if there is new instruction?  On the other way is ther=
e cpuid simulation on x86 system?

No=2E But trap and emulate unsupported feature is usual for other architec=
ture=2E
Almost all existing x86 processors have hardware cpuid implementation=2E
That will also happen on Loongson someday, we're preparing for that day=2E

>
>>=20
>> We can kill ugly probe method in applications when all
>> machine have upgraded kernel=2E
>I doubt application vendor has the willing of removing so-called ugly cod=
e but work broken
>on older kernel=2E

Nobody here cares vendor=2E We can only provide limited
support to non-FOSS application vendor=2E
We're trying to reduce maintainance overhead for other projects,
Loongson's business concern is out of our scope=2E

We're also trying to let applications compiled for general MIPS
can also benefit from Loongson's extension without troubling upstream too =
much=2E


We can still ensure the whole thing works on older kernel=2E
Just can't probe Loongson features correctly=2E

The whole proposal is just because Loongson even failed to establish a
stable interface for application to probe features=2E
Neither cpuinfo nor HWCAP is currently utilized by Loongson
(Probably in close-source kernel but that's also out of our scope)=2E

Also bit domain of HWCAP is limited, we don't want to see
Loongson occupy too much general MIPS resources, and CPUCFG can
provide unlimited config options=2E
So we decided to emulate CPUCFG instead of deliver them in HWCAP=2E

Thanks=2E

>
>>=20
>> And as you can see, cpucfg is exporting more config options than any
>> existing methods like HWCAP or cpuinfo=2E
>> And they may valuable to applications=2E
>>=20
>> Btw: Please fix your email client=2E
>>=20
>> Thanks=2E
>>=20
>

--=20
Jiaxun Yang
