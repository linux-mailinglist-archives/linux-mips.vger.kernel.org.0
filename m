Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 214E3B5A38
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2019 06:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfIREGx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 00:06:53 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:20643 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfIREGx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Sep 2019 00:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568779611;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Hws6/og70QLGaA5Ro6FijSEciEB5xl/q1IPTig9hMyw=;
        b=AHxWB9tZ/eHq+RsZRk0PUojoyHd7uLP2m+zhFReZRZHqeaIVQPM72CsC9BOsXli2Rq
        tP2aCyJJOFTxXDZ47/4fBVKiIWYVjYshAHrdgwoRhFA+rtJlPUwXQO/uVTVoKWVZ4w55
        4Liefoe84imzpTZE4TC+i7HQHyCIhjKkgOxPd7VD4YeDojs/+o9yGyuZdhp6Z0ZVGIiD
        zsIZU82P61lCxXlGwewUP8Zag17p20xlrXiNwOPZCwBKaWHa4z3xmJu2KGfedd1OQrBf
        pBzTgt+D9cpc//TpwpfMKvZnJHf/uR9vd26OE3eJN0Iy6pQHVrDyj2reMutvsBGpXQr1
        N/MA==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zmwdN52krmXIc+RZmA=="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
        by smtp.strato.de (RZmta 44.27.0 AUTH)
        with ESMTPSA id t0367bv8I43lnFX
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 18 Sep 2019 06:03:47 +0200 (CEST)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     "Alexander E. Patrakov" <patrakov@gmail.com>
Cc:     linux-mips@vger.kernel.org,
        "Ahmed S. Darwish" <darwish.07@gmail.com>, trivial@kernel.org
Subject: Re: A few issues with jitterentropy_rng
Date:   Wed, 18 Sep 2019 06:03:43 +0200
Message-ID: <10474356.2b4LHTj5ua@positron.chronox.de>
In-Reply-To: <5ed9605e-76ed-af7d-54fb-dc948abb627e@gmail.com>
References: <5ed9605e-76ed-af7d-54fb-dc948abb627e@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am Dienstag, 17. September 2019, 18:07:36 CEST schrieb Alexander E. Patrakov:

Hi Alexander,

> Hello.
> 
> While reviewing the code for jitterentropy-rng, I found a few issues.
> 
> 1. (linux-mips: that's why you are in the CC: of this mail) The code in
> crypto/jitterentropy.c uses the jent_get_nstime() function as a source
> of a high-resolution timestamp, and contains a check that the time does
> not go backwards too often. The implementation (defined in
> crypto/jitterentropy-kcapi.c) uses random_get_entropy() and, if it
> returns 0, falls back to ktime_get_ns().
> 
> The problem is - while the generic implementation of
> random_get_entropy() is indeed another name for get_cycles() and _is_ a
> monotonically increasing counter if implemented, this may not be true
> for random_get_entropy() on mips, because it has a fallback to
> read_c0_random(), which is not a cycle counter. This fallback to
> read_c0_random(), if I understand correctly, by virtue of returning
> non-zero, would prevent a more useful (?) fallback to ktime_get_ns() in
> jent_get_nstime().

Ok. I fail to understand what is the issue. Do you see any errors that you 
think you should not see?
> 
> 2. There are some outdated/incorrect comments in crypto/jitterentropy.c
> (patch attached).
> 
> 2a. Above jent_lfsr_time(): the comment says that ec may be NULL, but
> the function dereferences it unconditionally.

You are right, this is a copy and paste error from the user space code.
> 
> 2b. Above jent_fips_test(): the function returns void, but the comment
> talks about a zero vs negative return value. It would be correct here to
> talk about returning normally vs causing a kernel panic.

Yes, again a copy and paste error from user space. 

Could you please send the patch as a patch request to linux-crypto?

Ciao
Stephan


