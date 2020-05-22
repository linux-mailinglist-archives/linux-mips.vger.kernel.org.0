Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C238B1DE767
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 14:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbgEVM5w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 08:57:52 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17466 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729046AbgEVM5v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 08:57:51 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590152262; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=dOqdOyJJUuafoKKA8Kd9QZhsdjDajFoluhvDHR2QcAuGI6F8x3AWU/z1OvWaWQQxE+QFtFkxvMksH7GHCxqVGcOfW1vdpW5djTyJUdrMjG2yETq7BTVdsj+3K16JuD+opFjRJ4sXxzMVsKpb7AZcF4NhsmOtzlIHEWZ8a27TTUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590152262; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=HFnW7prDZXsN06VhSD1lx8Uh/gE5URMgrh1Egjir+1s=; 
        b=mkQP9B9CdE/AurhdWES6FEFT7LxyKSofdbnYQdUmUsNdD1bVlSahQLhVvynYedBlG83djbn3n9fXF8G/lQWEQLMu+VnrslM5tBxQIGPcM9tkLnKQwhqGaJUOWBAjtv6Xi9PAu+rYSHSCF0oomL1jYYNNveIREKf9qVpUs3eKzok=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590152262;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=HFnW7prDZXsN06VhSD1lx8Uh/gE5URMgrh1Egjir+1s=;
        b=SN9UfCLSIU2qHHyhJGWkYb90FDn6QdaYhohR/09G0UB7cnTEYkWSmWnv+PWSuMF3
        U3DVgoOBJIHhYH0q84mu3CFPiG9ZUjdcEvTIT+M8r7cNY0fLeAAt0/J2eJrm2o0rqaD
        fIr5rw4M2IE+mKM28oZUjr/Qz9hCTMAD1W4msaZI=
Received: from [127.0.0.1] (115.196.15.61 [115.196.15.61]) by mx.zoho.com.cn
        with SMTPS id 1590152259923503.40733696297673; Fri, 22 May 2020 20:57:39 +0800 (CST)
Date:   Fri, 22 May 2020 20:57:33 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     =?UTF-8?B?5q+b56Kn5rOi?= <maobibo@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
References: <20200521181403.6078-1-git@xen0n.name> <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
Message-ID: <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:06:01, "=E6=AF=9B=E7=A2=A7=E6=B3=A2" <maobibo@loongson=2Ecn> =E5=86=99=E5=
=88=B0:
>Sorry for late reponse=2E
>I just want to know how to solve compatibility on older kernel=2E
>It is ok to run user application with cpucfg instr on new kernel with thi=
s
>patch, however what if the application is running on older kernel without
>cpucfg simulation?

Application can firstly probe if CPUCFG is supported by kernel & hardware
by fork a thread and catch SIGILL signal or HWCAP=2E
Then decide use legacy methods or CPUCFG to probe other features=2E

Similar method have been proofed on Arm=2E
--=20
Jiaxun Yang
