Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB7F1815C1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 11:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgCKK2O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 06:28:14 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17873 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbgCKK2O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 06:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1583922472;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=3JtcSwh2mJxc7wOGkPwcMUPW0qPL58nKY7AyPUUwUa0=;
        b=X452yBY9ONVbwpQAj0flhzXrLG/MY1sKLO46rhgX15EuWaZYodJfE8PQflfVkC5a
        gittBRI/vWJzL1sDLeKux26J6fF2PbM+px34+CBBvP+65xabEiVjknNI2hfB6i84ylr
        5M9+kR0wMbzyd5pwKPjvldeRMYhOwZ/PZ+n7cFbk=
Received: from [10.233.233.252] (60.177.107.241 [60.177.107.241]) by mx.zoho.com.cn
        with SMTPS id 1583922468959882.4961712556443; Wed, 11 Mar 2020 18:27:48 +0800 (CST)
Date:   Wed, 11 Mar 2020 18:27:48 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOLZvyHEnnpWWhEAWx9RZASVjjQ=6HTREqwY+LK0hm=J4Wd8Xg@mail.gmail.com>
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn> <CAOLZvyHEnnpWWhEAWx9RZASVjjQ=6HTREqwY+LK0hm=J4Wd8Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
To:     Manuel Lauss <manuel.lauss@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <788597FA-6AD6-4218-886F-35C0916EA3F2@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:58:48, Manuel Lauss <manuel=2Elauss@gmail=2Ecom> =E5=86=99=E5=88=B0:
>Hello,
>
>> Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1449MHz
>
>How is this different from the __cpu_name[] array?  Doesn't it serve
>the same purpose?
>E=2Eg=2E on Alchemy, it lists the correct Model name=2E (I=2Ee=2E "Au1000=
",
>"Au1250", =2E=2E=2E)

Hi,

__cpu_name[] will be displayed as "cpu model" in cpuinfo, however
in x86 world, the name line is started with "model name"=2E
Most user applications like lscpu, hwinfo is following x86's rule, we don'=
t have superpower to move all of them=2E

Also rename "cpu model" will break current ABI, so just create a new array
for it would be a better option=2E

For why Loongson is doing this, I guess they need a chance to show
their business processor name instead of revision=2E

Thanks

>
>Manuel

--=20
Jiaxun Yang
