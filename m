Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5347B35EE
	for <lists+linux-mips@lfdr.de>; Fri, 29 Sep 2023 16:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbjI2OoD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Sep 2023 10:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbjI2Ont (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Sep 2023 10:43:49 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159C61BD
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 07:43:46 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso229204741fa.0
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998624; x=1696603424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWZEXqBEwKYX+GQWrMus5QxxGKvhA16X4eK3PAc1s1w=;
        b=Q+cv5ffreG3nWqqcHiB3whaKPxmkcyuFhW/lT0WhM6sT020iQp9qiHnzYnsl9MV9sG
         ZacgKTSCaMEXqjJ7a6mMbp1vo0VsESbCwph3WV8iAbOSQ9x2L2gVlpikI0xm+URIBTrr
         SsYAMs/s/h0dhlwVc+yD7uvRCuGSB9OrlzbRvQxiaF0KX0yY0Ur9w2s2TZjc9D8V9Hqh
         epeZtljqgLAcabI4GxaCee8WogkZo3IrI4g/hWMue4szm2uBWTokGJyeuVFSI4UxDBux
         XWWldBN0KKITwegoPFEondBKSESZFbvJYy8b9+rt6SSKFz0SgSmEA5lIaq7MUl+Hm48X
         k4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998624; x=1696603424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWZEXqBEwKYX+GQWrMus5QxxGKvhA16X4eK3PAc1s1w=;
        b=vYKdRhhjQc+Akt5GoSlgZyyt6QqPnZ/jxIHOywfRFQaabb31XBfI+rdd6nM7OtaXt7
         ez7P4WTbGlQiNp8gOWNgmhea410oj66W9ha/3baqUW03OuyttzJ/MFnqDKQhSAL+cPI6
         X0sx3pR5TTkHGrEstTi/TV1xYjOVwSAfsTSwUJsz4/g1xYkI+Jkc2ZVlPwdjS1mtTmKX
         wCYByTUe6KpcuqLWNGGltOWTkguNIuSEDcjZ66WHFqHtmgm2+azHj/C9qVKsZWTVIxSY
         0zjw/qtH8GLC/pihNxrey1BgT/uYUUOsDwdtowuq+XRdwviYmcUhCpcZH1EQsSrplBXa
         2R8g==
X-Gm-Message-State: AOJu0YyXj/pV6XmEwEK5m6WRAQPhp7UHwsWvKKZpgVIXdksBCgp+gYMS
        R0BBIgHy2xlOdS6Wo9df3ZoAwA==
X-Google-Smtp-Source: AGHT+IG7A0is/mCcSJ7Qj3MpBLPxF93Q9i37DM00Npe+atjV+GadUDqyw91BeF5V9llOySb8/nOeJg==
X-Received: by 2002:a05:6512:ea8:b0:500:780b:5bdc with SMTP id bi40-20020a0565120ea800b00500780b5bdcmr4042373lfb.49.1695998624293;
        Fri, 29 Sep 2023 07:43:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b0040472ad9a3dsm1559213wmc.14.2023.09.29.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:43:43 -0700 (PDT)
Date:   Fri, 29 Sep 2023 17:43:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
        Oliver Crumrine <ozlinux@hotmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
 <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 29, 2023 at 05:39:46PM +0300, Dan Carpenter wrote:
> On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> > This is weird.
> > 
> > I managed to reproduce this once but couldn't reproduce it again after
> > that.  It seems like an intermittent thing to me.
> 
> Nope.  I'm just dumb.
> 
> Commit b33a296d8311 ("staging: octeon: remove typedef in structs
> cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
> drivers/staging/octeon/octeon-stubs.h but didn't update
> arch/mips/include/asm/octeon/cvmx-pip.h.
> 
> I can send a patch for that.

Actually, perhaps we should just revert the patch?  Staging patches
aren't supposed to touch outside of the staging directory.

regards,
dan carpenter

