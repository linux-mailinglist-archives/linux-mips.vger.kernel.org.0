Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06295139470
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 16:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgAMPMK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 10:12:10 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:60203 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgAMPMK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 10:12:10 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id EC4849401CC;
        Mon, 13 Jan 2020 18:12:07 +0300 (MSK)
Received: from mxback4q.mail.yandex.net (mxback4q.mail.yandex.net [IPv6:2a02:6b8:c0e:6d:0:640:ed15:d2bd])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id E77A761E0015;
        Mon, 13 Jan 2020 18:12:07 +0300 (MSK)
Received: from vla3-5ed9a7202853.qloud-c.yandex.net (vla3-5ed9a7202853.qloud-c.yandex.net [2a02:6b8:c15:341d:0:640:5ed9:a720])
        by mxback4q.mail.yandex.net (mxback/Yandex) with ESMTP id VNeawOptGF-C7ZuA2Nw;
        Mon, 13 Jan 2020 18:12:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578928327;
        bh=eK+vHUde1swh7a+9Npfs+wq4KjeBPOnj4HpBzxp+mp0=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=pbL2F3DrctmDSiA5gS4HEncBKYcEFL5MVO1q0lbnNEfvKIbgKK4RrFGdYrdawL9zr
         VJleDsn5fjn8Qo0lJXXisrYb6d0yO8W7xEdokj6sWDLDBcLTIWT+ouLI8ktXU84md/
         8B2+THCs9cZmYk7m+s2FQpE80LUlD6FeP5U30YMU=
Authentication-Results: mxback4q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-5ed9a7202853.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 5sam768AAa-C5V8HnwZ;
        Mon, 13 Jan 2020 18:12:05 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 13 Jan 2020 23:11:58 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200113145820.GA9817@lst.de>
References: <20200113140705.74605-1-jiaxun.yang@flygoat.com> <20200113145820.GA9817@lst.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] MIPS: Define pgprot_dmacoherent according to coherentio status
To:     Christoph Hellwig <hch@lst.de>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, linux-kernel@vger.kernel.org, hch@lst.de
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <6A037EB9-B5FE-462F-A6EA-8FD874432E75@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:58:20, Christoph Hellwig <hch@lst=2Ede> =E5=86=99=E5=88=B0:
>On Mon, Jan 13, 2020 at 10:07:04PM +0800, Jiaxun Yang wrote:
>> For MIPS chips that support coherentio DMA, it's always safe
>> to make DMA requests cached=2E
>
>For DMA coherent devices pgprot_dmacoherent isn't even used, so this
>doesn't make sense=2E

Hi,

I'm supposed to use it later in drm/ttm
 ttm_bo_util to overwrite pgprot for TTM_PL_SYSTEM=2E
And I wish this pgropt can always represent dmacoherent pgropt=2E
Would it be fine?

Thanks

--=20
Jiaxun Yang
