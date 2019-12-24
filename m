Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED6312A0FE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 13:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfLXMEh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 07:04:37 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37467 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfLXMEh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Dec 2019 07:04:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so8405846plz.4
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 04:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=VHzH6WH6Y51Hv8qWhxgK6vx35XDhgJUQtiy7D9VMqAM=;
        b=AQugnPU1j3l+UliZJ1cFDWfn1gfoQcO/nzfL11rOcYeTLX/P87iqPaaJmBaMlSz7f1
         /DhGazm2NTR2ZIaiN+mUvEAnOZrI7Ge0Mg1zI2ZlVdeTi0aTgDWcWRqSCId8E113LX3m
         6HCYlixeRMc9TaLMlaAzwKbLAUzigX1Ncl8C866LmmeME3vMRc45SQjPLyr6MHX+L6Cw
         vv52P5dueRyUQBwwusD+tHpoqoHbOj8XjhE0q9U9hlqCHn27d/gBrcaQanBO29ITAp34
         bn7tzg79vFow2UHY2TlVVezhuLVq4rXQXKJzfTff9415HHT3maptkAcWgSZsizcHzud6
         8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=VHzH6WH6Y51Hv8qWhxgK6vx35XDhgJUQtiy7D9VMqAM=;
        b=n198zguHwoWA6fpMShj1fpkjswQ6GmjuTX7dExIWjawBNIuB/Pm9vFoCfkMU/9ghp8
         IByUdAQRQzhTOiUTl9XUM+AjRjXtN3gAO2J6Ny+fFlY1D/w0xNxwqGYqGMhIsxaXFyhh
         PqwSB0jMxJY3D/nnJhdEKdeO3hBfZXN9y0DYJwRH/TS/yWk+LHW5LfGb3lAmMGdz+1TG
         3K+7ajGL78qwTQgHogzRnwxFQSqa95n8fQdQg6Oms3LbsADa9mVnBfs+tplZKKCDuqFf
         Bkj3jTmECYPrO2nW+kIeL4KWcTEGWH0iI4Dntq3ZkM1xXKkwC53LiuiLTlmUxfssBFdW
         WJ6A==
X-Gm-Message-State: APjAAAWCfsUGFHbRumoxgqRzGgKxeueFZS7LiKb0+NCHSzTWzqqM0Yt+
        9p5W0v+HOTpkVfeMBhgECUroSMrzJj6vSw==
X-Google-Smtp-Source: APXvYqyJXa2dY59EyR45IM7PX4/Dja/wo48oiNHNLhyt3TL1GWpIJ61wHLTCUZ3QRkI0SvFitogUkA==
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr34182926pll.341.1577189076952;
        Tue, 24 Dec 2019 04:04:36 -0800 (PST)
Received: from [192.168.0.9] (111-255-104-19.dynamic-ip.hinet.net. [111.255.104.19])
        by smtp.gmail.com with ESMTPSA id k21sm14926039pfa.63.2019.12.24.04.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 04:04:36 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in __c_kernel_time()
Date:   Tue, 24 Dec 2019 20:04:33 +0800
Message-Id: <98C1F790-7647-4203-9B31-4B8FED8CCA12@amacapital.net>
References: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
In-Reply-To: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
To:     christophe leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> On Dec 24, 2019, at 7:12 PM, christophe leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> Le 24/12/2019 =C3=A0 02:58, Andy Lutomirski a =C3=A9crit :
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> READ_ONCE() forces the read of the 64 bit value of
>>> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
>>> only the lower part is needed.
>> Seems reasonable and very unlikely to be harmful.  That being said,
>> this function really ought to be considered deprecated -- 32-bit
>> time_t is insufficient.
>> Do you get even better code if you move the read into the if statement?
>=20
> Euh ...
>=20
> How can you return t when time pointer is NULL if you read t only when tim=
e pointer is not NULL ?
>=20
>=20

Duh, never mind.

But this means your patch may be buggy: you need to make sure the compiler r=
eturns the *same* value it stores. Maybe you=E2=80=99re saved by the potenti=
al aliasing between the data page and the passed parameter and the value you=
 read, but that=E2=80=99sa bad thing to rely on.

Try barrier() after the read.=
