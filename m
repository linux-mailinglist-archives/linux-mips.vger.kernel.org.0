Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAAE1DE911
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgEVOed (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 10:34:33 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17404 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730010AbgEVOec (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 10:34:32 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590158060; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=MeE69lPbXIgemfUMuUJb3p9xUzJdoYTp307LE6Cn4mYGVqQ4pSJVdhXBV6L4Hx6OI/GuoAgJ0SQnMctEutuUPDnNyreG0MygGAGO04c7+C9d+Qstjo9BUGSnyYMJsIupbsmgT5jwkmnhCOByMPupiibv7gHb08BIXYVbQRHK/Uk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590158060; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=fKZiVey1VgHB6vnG+tOYv8FbXrxDy6z19WSGtLzIsVk=; 
        b=ZsHB6VlRa+iIfv326R3U0VkRdd77xglMkeF+WZCTwm0dxT2l62VX4O+sG/5Y94keVv9jCW8wgpNV81mlUVfPPMQLwQuM70JBf87ws66jJo0vZuR/vSdvcfDooa4mwI7+USx4iegUCwHJnmtzBVHpccmeXg+Zeek6svzcUErOYYo=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590158060;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=fKZiVey1VgHB6vnG+tOYv8FbXrxDy6z19WSGtLzIsVk=;
        b=P2Rpd28u4a71Y568Dq0/07xV3l34X7zUXeAWVGHLy72ZCzFFLwbeQldi4yWcLpIq
        Y8uEHv8Mz/wUtOhjkHAxUaGxzpVz3LwWzy7han6CS75cdEHMMtvrrWu/FckaXgqCwl4
        jqIq6GBa1d5sKWYmY/6JTmYtAo5FDb6j1XMW9AtM=
Received: from [127.0.0.1] (112.17.236.178 [112.17.236.178]) by mx.zoho.com.cn
        with SMTPS id 1590158057194853.482175810878; Fri, 22 May 2020 22:34:17 +0800 (CST)
Date:   Fri, 22 May 2020 22:34:13 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     =?UTF-8?B?5q+b56Kn5rOi?= <maobibo@loongson.cn>
CC:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: Re: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn>
References: <20200521181403.6078-1-git@xen0n.name> <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn> <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com> <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn>
Message-ID: <50F35B43-9313-4083-A98F-45FCA3F516E2@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:14:02, "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@loongson=2Ecn> =E5=86=99=E5=
=88=B0:
>
>
>
>&gt; -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
>&gt; =E5=8F=91=E4=BB=B6=E4=BA=BA: "Jiaxun Yang" <jiaxun=2Eyang@flygoat=2E=
com>
>&gt; =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2020-05-22 20:57:33 (=E6=98=9F=
=E6=9C=9F=E4=BA=94)
>&gt; =E6=94=B6=E4=BB=B6=E4=BA=BA: "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@=
loongson=2Ecn>, "WANG Xuerui" <git@xen0n=2Ename>
>&gt; =E6=8A=84=E9=80=81: linux-mips@vger=2Ekernel=2Eorg
>&gt; =E4=B8=BB=E9=A2=98: Re: [PATCH v3 0/1] CPUCFG emulation on older Loo=
ngson64 cores
>&gt;=20
>&gt;=20
>&gt;=20
>&gt; =E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=888:06:01, "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@loongson=2Ecn> =E5=86=
=99=E5=88=B0:
>&gt; &gt;Sorry for late reponse=2E
>&gt; &gt;I just want to know how to solve compatibility on older kernel=
=2E
>&gt; &gt;It is ok to run user application with cpucfg instr on new kernel=
 with this
>&gt; &gt;patch, however what if the application is running on older kerne=
l without
>&gt; &gt;cpucfg simulation?
>&gt;=20
>&gt; Application can firstly probe if CPUCFG is supported by kernel &amp;=
 hardware
>&gt; by fork a thread and catch SIGILL signal or HWCAP=2E
>&gt; Then decide use legacy methods or CPUCFG to probe other features=2E
>&gt;=20
>&gt; Similar method have been proofed on Arm=2E
>Sure, if  that works, what is the purpose of this patch? Do we need cpucf=
g
>simulation on older machine since there is proper method already?

Because it's more efficient and elegant=2E
Also applications can assume systems without CPUCFG have
no Loongson extension support=2E
That can save hundreds lines in various applications=2E

We can kill ugly probe method in applications when all
machine have upgraded kernel=2E

And as you can see, cpucfg is exporting more config options than any
existing methods like HWCAP or cpuinfo=2E
And they may valuable to applications=2E

Btw: Please fix your email client=2E

Thanks=2E
--=20
Jiaxun Yang
