Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1763DA004
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbhG2JEH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 05:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234972AbhG2JEG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 05:04:06 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DDAC061757;
        Thu, 29 Jul 2021 02:04:03 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id y200so6133764iof.1;
        Thu, 29 Jul 2021 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=obmNjwOpYpNIrk2WRzS0fBK8P38CDDlYfyhz5quNEUc=;
        b=QSCmSlY8mauv1ESXdaQmS8cIJikGHlCYwi9+ErHMzezvQ6/1Vg18aHSiWFuH+JFCka
         6jursxSH5n2F6Kufg9Vt44FNFSVaBIkd8LHJf2Mb7TNJo6/Q9ObBLpWdnmKbvK2snGpD
         lbyb1Ds8qNvipV1JMNiRItVom0e49e8pe9UfLLNyzGECrSyyaqfvne/LUG83fGdv0RC+
         ppNO252CrN9W/Fg6dNFcuxxZxuvmFiqcuhp91h5O67Cw2peWBg/qfVmhMWJULk6CtiTK
         YRdd1k1TaGW+j/3UVx+4CBXdXqKEdmpVjmCTrFFZF95HhA0JR2FmpehD6rDB0Qho5Gtj
         iQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=obmNjwOpYpNIrk2WRzS0fBK8P38CDDlYfyhz5quNEUc=;
        b=HnKxgU9zDoDG6RYTZ/kJCHK0KSEKIfENW3hqQ9v2/3f8Hdieepqu5MqgeUnQ3Fr/8/
         VknT8kisKbazhfpk4dnAW00lwKmiBlbwCuzVyI8z5sZZ87y1kVbS9CWWIR2tRRoVtfkX
         UHAOem6E6bH0N93v2YxlMQ6r8HRgmYHUPC3sWslhkUBocbu3aFYlcbDdatsQNb1/Zwt1
         v5nuF43FQnragXOOdDmx0qKnq56HukQpdVI99nrjWkB+0xo8UKY/nBP5kch3HikaaPWJ
         R48bHKnDU7Yt5wjtrYeLNs4BLBde+FV+vMKQJw7o0nyJxfSxUojKDdOY3PdvqWS7Jslm
         7Sog==
X-Gm-Message-State: AOAM530C36UGZKqH218VbeP1sN8HW2V/6/g0Y7n/xjwcg5G7/e1YWcXS
        jU+dgU1JDi7ddu/Gf8EQMoAiEm+iK88FGdP0
X-Google-Smtp-Source: ABdhPJwUcldzmoxgaOsLX3ceCtFrwbn0kXUzxzDaZtsezarSFjWMXXNi4Qy1x4yM4N49kPBLWpS5/A==
X-Received: by 2002:a5d:8596:: with SMTP id f22mr3324274ioj.147.1627549442495;
        Thu, 29 Jul 2021 02:04:02 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id o13sm1534851ilq.58.2021.07.29.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 02:04:01 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailauth.nyi.internal (Postfix) with ESMTP id 582EA27C0054;
        Thu, 29 Jul 2021 05:04:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Jul 2021 05:04:01 -0400
X-ME-Sender: <xms:_24CYYQwA5VkM3dtD8jp2S0WmkW4K7nCbiSIsapjAPmLhEcq_SkOhw>
    <xme:_24CYVxcmMnmCFpiUqk_gmAig20Z1xZul0GMjrN53C-hh-_WmuNgYLLYzG94v3z8i
    A2akz0FxFFgbBXtuQ>
X-ME-Received: <xmr:_24CYV1TCp1uRT0LV7VcnB4c-JZnMMI1fbpFibdejBtYH9rBSn7eqsWnqt-VRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedugddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvleeigedugfegveejhfejveeuveeiteejieekvdfgjeefudehfefhgfegvdeg
    jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvg
X-ME-Proxy: <xmx:_24CYcB46uj77qGu26MhD67VBi9ZsEVR7hKwbuRcb0URoPqLQp9V8Q>
    <xmx:_24CYRiuleEdv2jnMRMRdL85SA0QpyndiqsUoGr-mgLVIuaQ2tpH4g>
    <xmx:_24CYYpMK1ZHlLtWE0y4bCFUe_WfI-fLW3Cj3hhHdAECCFGaHuSb7g>
    <xmx:AW8CYcW-bQM5nkQqAT3FGmI8jqJAA3od-RE6Wu5RaW2kgPE9_fzaLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 05:03:59 -0400 (EDT)
Date:   Thu, 29 Jul 2021 17:03:37 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Rui Wang <wangrui@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, hev <r@hev.cc>
Subject: Re: [RFC PATCH] locking/atomic: arch/mips: Fix
 atomic{_64,}_sub_if_positive
Message-ID: <YQJu6fTIpeuGV+UX@boqun-archlinux>
References: <20210729082549.144559-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729082549.144559-1-wangrui@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 04:25:49PM +0800, Rui Wang wrote:
> This looks like a typo and that caused atomic64 test failed.
> 
> Signed-off-by: Rui Wang <wangrui@loongson.cn>
> Signed-off-by: hev <r@hev.cc>

In your upcoming patches, please change this part to your real name.
Here is a quote from Documentation/process/submitting-patches.rst:
  
	using your real name (sorry, no pseudonyms or anonymous contributions.)

Regards,
Boqun

> ---
>  arch/mips/include/asm/atomic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index 95e1f7f3597f..a0b9e7c1e4fc 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -206,7 +206,7 @@ ATOMIC_OPS(atomic64, xor, s64, ^=, xor, lld, scd)
>   * The function returns the old value of @v minus @i.
>   */
>  #define ATOMIC_SIP_OP(pfx, type, op, ll, sc)				\
> -static __inline__ int arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
> +static __inline__ type arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
>  {									\
>  	type temp, result;						\
>  									\
> -- 
> 2.32.0
> 
