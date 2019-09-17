Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE11FB5274
	for <lists+linux-mips@lfdr.de>; Tue, 17 Sep 2019 18:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfIQQHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Sep 2019 12:07:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43785 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfIQQHk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Sep 2019 12:07:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id d5so4095421lja.10
        for <linux-mips@vger.kernel.org>; Tue, 17 Sep 2019 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:from:subject:to:message-id:date:user-agent:mime-version
         :content-language;
        bh=7rimlqaFM+EX2ZMaZtAqp/RIPZ1bV29Rq5ORAqxUf4I=;
        b=KLGHOMHX6OWkFDYgG4GNsEs+8+1jl2b0eY9e+jkBfVBfDvwJtlJ+kiJto9Y8phMT/V
         NHOPva+yYJqlWpso7ta2tcuiKGBSGNrT4k3kBiVGb3IecV5MEzUNXNwY7T/fS1KR6OkQ
         01SX8WD7krrffDoQzwrBJiczg0uvdSRvOsQ2uUIYXuMPMeLoktdT14p/NvQ92UWt2323
         xWh7rVm4jaBMnXLuvEKghONcxWDzt+5Jw/waZrw8Fa4gQ9DQgeJ1Xl90+A5thBL3luBd
         Uc3s32OM+1YqM0euuA5AYqJNq5oZVSihAL/+VJrawKw+ap6LVtMV0iDWbhaicMtQtfTQ
         regg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:from:subject:to:message-id:date:user-agent
         :mime-version:content-language;
        bh=7rimlqaFM+EX2ZMaZtAqp/RIPZ1bV29Rq5ORAqxUf4I=;
        b=r71FTtl12vNvqWUON+i46+dxH6nxCU0mJZv2qEUIfu5Cb/R7LzmczasxuKywnITxph
         MpYzNnTS9WpKGsf21hEAR4RVheHADJytihxOL3o+JZHphBxKYkcQJxZMexF/XzFjPOuD
         5jXWTeO6YFLeM9hSdr8jn9GU0pEhX7KonQ5yA/QzhrYP7ZU/1BFaLmvy7MGdeYMI/RKc
         7RjZY6/gopHdYu9nTFfTk1c69/EpsF6JtF/SJqSkD8olpp8YY8iI0AJXo9KWqJrCKBYV
         dqQ0mH3kmyERAqZyDM9afBt/ItRRE4kBZyoKoDBP6seoQe/3kViiXpI84DSYyBmmkPXT
         S8Jg==
X-Gm-Message-State: APjAAAVo55YZVOYE9kN41MMLz4+I6eHUaRyaLOZ/nxz665pv0c1gsaPT
        7Bv+bWAZ4vPvXZ4soph+fTvNMMIokqVljQ==
X-Google-Smtp-Source: APXvYqzkqrfPpbOmhFwIuajnkXSmHV1D92AmY8YApBVaQKCwsP4Y/OEBy0ordy/QLxx6oi7AAGU8Xw==
X-Received: by 2002:a2e:442:: with SMTP id 63mr2389077lje.66.1568736458361;
        Tue, 17 Sep 2019 09:07:38 -0700 (PDT)
Received: from ?IPv6:2a02:17d0:4a6:5700::72c? ([2a02:17d0:4a6:5700::72c])
        by smtp.googlemail.com with ESMTPSA id d13sm508872lfm.21.2019.09.17.09.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 09:07:37 -0700 (PDT)
Cc:     linux-mips@vger.kernel.org,
        "Ahmed S. Darwish" <darwish.07@gmail.com>, trivial@kernel.org
From:   "Alexander E. Patrakov" <patrakov@gmail.com>
Subject: A few issues with jitterentropy_rng
To:     Stephan Mueller <smueller@chronox.de>
Message-ID: <5ed9605e-76ed-af7d-54fb-dc948abb627e@gmail.com>
Date:   Tue, 17 Sep 2019 21:07:36 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------94846B9EED46633C9BAD5F70"
Content-Language: en-PH
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a multi-part message in MIME format.
--------------94846B9EED46633C9BAD5F70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

While reviewing the code for jitterentropy-rng, I found a few issues.

1. (linux-mips: that's why you are in the CC: of this mail) The code in 
crypto/jitterentropy.c uses the jent_get_nstime() function as a source 
of a high-resolution timestamp, and contains a check that the time does 
not go backwards too often. The implementation (defined in 
crypto/jitterentropy-kcapi.c) uses random_get_entropy() and, if it 
returns 0, falls back to ktime_get_ns().

The problem is - while the generic implementation of 
random_get_entropy() is indeed another name for get_cycles() and _is_ a 
monotonically increasing counter if implemented, this may not be true 
for random_get_entropy() on mips, because it has a fallback to 
read_c0_random(), which is not a cycle counter. This fallback to 
read_c0_random(), if I understand correctly, by virtue of returning 
non-zero, would prevent a more useful (?) fallback to ktime_get_ns() in 
jent_get_nstime().

2. There are some outdated/incorrect comments in crypto/jitterentropy.c 
(patch attached).

2a. Above jent_lfsr_time(): the comment says that ec may be NULL, but 
the function dereferences it unconditionally.

2b. Above jent_fips_test(): the function returns void, but the comment 
talks about a zero vs negative return value. It would be correct here to 
talk about returning normally vs causing a kernel panic.


-- 
Alexander E. Patrakov

--------------94846B9EED46633C9BAD5F70
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-jitterentropy-fix-comments.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-jitterentropy-fix-comments.patch"

From cbbdb4bc2c428f8ccd684ebd99b287689c4a625c Mon Sep 17 00:00:00 2001
From: "Alexander E. Patrakov" <patrakov@gmail.com>
Date: Mon, 16 Sep 2019 09:36:30 +0500
Subject: [PATCH] jitterentropy: fix comments

One should not say "ec can be NULL" and then dereference it.
One cannot talk about the return value if the function returns void.

Signed-off-by: Alexander E. Patrakov <patrakov@gmail.com>
---
 crypto/jitterentropy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/jitterentropy.c b/crypto/jitterentropy.c
index 77fa2120fe0c..9597f9f5723d 100644
--- a/crypto/jitterentropy.c
+++ b/crypto/jitterentropy.c
@@ -172,7 +172,7 @@ static __u64 jent_loop_shuffle(struct rand_data *ec,
  * implies that careful retesting must be done.
  *
  * Input:
- * @ec entropy collector struct -- may be NULL
+ * @ec entropy collector struct
  * @time time stamp to be injected
  * @loop_cnt if a value not equal to 0 is set, use the given value as number of
  *	     loops to perform the folding
@@ -400,8 +400,8 @@ static void jent_gen_entropy(struct rand_data *ec)
  * primes the test if needed.
  *
  * Return:
- * 0 if FIPS test passed
- * < 0 if FIPS test failed
+ * returns normally if FIPS test passed
+ * panics the kernel if FIPS test failed
  */
 static void jent_fips_test(struct rand_data *ec)
 {
-- 
2.23.0


--------------94846B9EED46633C9BAD5F70--
