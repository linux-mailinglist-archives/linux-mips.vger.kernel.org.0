Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9802B98E7
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 18:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgKSRG0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 12:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbgKSRGZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 12:06:25 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D33C0613CF;
        Thu, 19 Nov 2020 09:06:25 -0800 (PST)
Date:   Thu, 19 Nov 2020 18:06:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605805584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bfpqeXRvpn1SL3kgLsKl7DAHmAFazpLRET3v8Rfi1hU=;
        b=q15BS6T8StWZOi1cLi9Q11EBokwQlBl8gOlE6gifMyrK936NQ4rlK4rrmHEFwKqpHdVbIi
        MN/ATzg24htROT2MB3yntTwEBMtHlj6kx880ZYGaGCMF83aOKSm58r6Zmm7nOfZKuRCJWn
        zCjZK4zFAPFNMciPjTEmgF1YfKRHPKrV1vGgovCqFfv/xUpxmjD0xJfkjvmd5jiOslEbrY
        sqMF0hfpynqU4+QRaLChEW1TYkG5O1x2MbJjN6FkTKH4SytSw1vilF5nsrgAu/9R0Fg97Y
        8e5+7B77ghWzVTbj8F+/SqtpRZRd9ERKaXnlSG38QVkv+Oacx6oJy9nZe428rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605805584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bfpqeXRvpn1SL3kgLsKl7DAHmAFazpLRET3v8Rfi1hU=;
        b=FvoylmmGvyvC5EgwoEZVd5+xcPeAs07OuXxHDWxnwFkjQJ1DVb0qJMMYwgdqgwIwKVXbC+
        97Xl4kFAuDu+qwBA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Yoichi Yuasa <yuasa@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH REPOST] pcmcia: Remove NEC VRC4173 CARDU
Message-ID: <20201119170622.yan5bt2chxvoxqgn@linutronix.de>
References: <20201113213408.2244169-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201113213408.2244169-1-bigeasy@linutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-11-13 22:34:08 [+0100], To linux-kernel@vger.kernel.org wrote:
> This driver is the very definition of bitrotting:
> - Introduced in commit
>   79a140932c776 ("[PATCH] mips: vR41xx updates")
>   which is 2.6.11-rc3.
>=20
> - Provides ->register_callback which was removed in commit
>   7f316b033b36a ("[PATCH] pcmcia: remove socket register_callback")
>   which is v2.6.14-rc3
>=20
> - Uses INIT_WORK() with three arguments which was removed in commit
>   65f27f38446e1 ("WorkStruct: Pass the work_struct pointer instead of con=
text data")
>   which is v2.6.20-rc1
>=20
> - Provides ->inquire_socket and uses socket_cap_t which was removed in
>   commit
>   b7949fdacbe00 ("[PCMCIA] Remove inquire_socket")
>   which is 2.5.72
>=20
> - Provides ->get_io_map which was removed in commit
>   d7de1b64a23b9 ("[PCMCIA] pcmcia-2: Remove get_io_map and get_mem_map so=
cket methods.")
>   which is 2.5.66
>=20
> Remove VRC4173 CARDU from the tree because it never had the luck to be
> successfully compiled. Let it finally find peace in byte heaven.
=E2=80=A6
> This is a repost of
> 	https://lkml.kernel.org/r/20201001193234.gi6fp4vk3dypwifv@linutronix.de
>=20
> which was a repost of
> 	https://lkml.kernel.org/r/20200916081629.cfi6svr3yjvzimqs@linutronix.de

Andrew, are you okay with routing this via your tree?
Nobody responded to this and as I documented in the patch description it
never compiled so.

Sebastian
