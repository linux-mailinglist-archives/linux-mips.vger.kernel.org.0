Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDBC5C460
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 22:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfGAUl6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 16:41:58 -0400
Received: from mail-yb1-f171.google.com ([209.85.219.171]:39457 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfGAUl5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 16:41:57 -0400
Received: by mail-yb1-f171.google.com with SMTP id u9so515057ybu.6
        for <linux-mips@vger.kernel.org>; Mon, 01 Jul 2019 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmwTjBaBEjCcnXSMwgqKIPST2Lk3AbJK4zNOvtmMH78=;
        b=K9W18XN5AWgW8FXcrA357ulXlIA+ubp/CK4SQVyS3hsphD51/HpPhfcF4ekzFcR6oz
         wwX8kp5UNJu/wXdb76Fi2+Kf0zuxndxpcek8J0GRScSd6EPhJ/Rn0wyB6rX1+5Ml7zKN
         2r54P7rbkiul47QqWMjS7alMGPSrg/2GxGWikS3IpuU7g7509oe2F5VpxPM5KTu8mJ5k
         u/W9nsNIlOg8D/+Bt9tdt/wr+og6TuDlvqvdKe5l2fRzVQCzJoEH4alZeRB73lKjIjeg
         ib8FgfEKsvsZysyWAZPAemC5ebOPOvRe3ttAmaHiTcQUn2UsDp5QYBTq1aGWbDshnmsL
         dC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmwTjBaBEjCcnXSMwgqKIPST2Lk3AbJK4zNOvtmMH78=;
        b=Dd3Lij/XyYLENL5JIGKif8tm8sHUwnksYZaQW0Qi1FDB7kK/lAoiIu88UCnFXl1S4O
         qZOsWqz0GX3FnxtGfEKtqIQNvBu/oWL3N2jszknFwEZdA1LooMnBtwdcXpI3ZB9N0UbD
         sh5mQ3VTlz+D+1m2KsYQqamO5mObhbZ/Fq63NEtmTIU2oktwao/dIsGNNYMOGgU7lKEF
         BQQShYBmimafiZ9jremxc8WZGH7wFUQ7khP/oSGx4sYmkMRgSYVY8qBHs2gcLypsF3tI
         BMzwt1zYh/xCKlSpUvIY3iySbcDsiTC7YbxVa28bUkaVF07T6Ue8HHYt2EPMPV4QWkYJ
         svgw==
X-Gm-Message-State: APjAAAXPEvFRDX3rtAS/fmv797vEXa1ykeaGJ/wcLN9mOH63yqxaLgru
        M5wjh2udxUWTsrSuRBVqa/d1JuxSh/xb/s65Ejw=
X-Google-Smtp-Source: APXvYqxxxgpxJDDF8xU5KVDE2Gpc2d8PvvAArpHn2yL6ZOgOW6L7qAb26KF7N1YyzuBYXl5EuBl/+eSFWnjw4h5zEKs=
X-Received: by 2002:a25:bacf:: with SMTP id a15mr17361865ybk.213.1562013717224;
 Mon, 01 Jul 2019 13:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
 <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
 <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com>
 <f633861c-900f-02c5-e592-2ea1c3f1f8f2@gentoo.org> <CA+QBN9Bdnppin1s882OzvkOFCoWmOi_ctWkas2EsxD2mintS7w@mail.gmail.com>
 <5b019eaa-5e2f-b9ce-9c56-5bb0cfc253ed@gentoo.org>
In-Reply-To: <5b019eaa-5e2f-b9ce-9c56-5bb0cfc253ed@gentoo.org>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 1 Jul 2019 22:41:45 +0200
Message-ID: <CA+QBN9CDWAe6YQ6nvnWOK5MrjdCD-PrQehsaT4PJf13cEPCBoQ@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Matt Turner <mattst88@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> The early widget addresses you show, 0x1axxxxxx

can you give me a memory mapping table for the those XIO devices?

> shows Slot D (widget 9) being populated by something that has a BRIDGE chip in it.

The BRIGE is a ShoeHorn. I have three units here and two Octanes.
They have always shown the same behavior.

My conclusion is: the hardware is not damaged, it's a software problem.

> Does that address space probe correctly (0x19xxxxxx)?

It seems so. Anyway, even the ShoeBox is probed correctly but it
doesn't work correctly!
It doesn't panic, but it shows a lot of quirks.

What have I to enable in the kernel to debug the PCI and stuff?
