Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263831658F5
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 09:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgBTIPh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 03:15:37 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17957 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726466AbgBTIPh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 03:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582186495;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=ba15D71WM0TZsIQOmNCZ0fPENXbBRJUGx/lLfYnaJ34=;
        b=YV1tA3OKGl8+N12UqweV/Bmk71bqSri5WYrj+Rz4YE9PoytJruQSkfZLZXE8A10S
        VNqGIu3T50hssTNTlB5NbuUCeNUvZf3J36tMnLEhGDwpX/l+FqJsbFb0TGjjj0gqurn
        PGKbDr86QNyPGFHIlHXNMPR7mTe3U/u/vhb/npjk=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582186493587928.9027487890974; Thu, 20 Feb 2020 16:14:53 +0800 (CST)
Date:   Thu, 20 Feb 2020 16:14:53 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Huacai Chen" <chenhuacai@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Cc:     "Paul Burton" <paulburton@kernel.org>,
        "LKML" <linux-kernel@vger.kernel.org>, "ysu" <ysu@wavecomp.com>
Message-ID: <17061a9f690.e5cbd01f5685.8497926865164942268@flygoat.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882:=
44:03, Huacai Chen <chenhuacai@gmail.com> =E5=86=99=E5=88=B0:
>Hi, all,
>
>I suggest Jiaxun Yang to be the new Linux/MIPS maintainer because of
>the following reasons:
>
>1. He is familiar with Linux kernel & MIPS architecture.
>2. He is active and has already contributed many patches.
>3. He is not an employee of any corporation, so people can expect him
>to be neutral.
>4. He is young and has enough free time to follow the mainstream
>development closely.
>5. His English is good and is willing to maintain a good level of
>communication with other contributors.
>
>Jiaxun, what's your opinion?

Resend as MIPS List rejected the previous mail.

Thanks for your recommendation.

It's my pleasure to take this duty if I'm eligible.

I have experience in MIPS chips and have already involved in some review pr=
ocesses.
i.e.loongson, Ingenic/MediaTek & etc.

As what Huacai has said, I'm a pure contributor from community,
which means I will able to be neutral to MIPS family members.

[Also added Yunqiang Su to Cc list as he is the
only current MIPS company employee I know.]

Thanks.
>
>Regards,
>Huacai Chen
--=20
Jiaxun Yang

