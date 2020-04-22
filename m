Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE14D1B4FFA
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 00:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgDVWQr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 18:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725839AbgDVWQq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 18:16:46 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80857C03C1A9;
        Wed, 22 Apr 2020 15:16:46 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m18so3637369otq.9;
        Wed, 22 Apr 2020 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hdhi8o/uOWcv18fMCxckchm+UgJLFPrhgXGldfLApj0=;
        b=UnJh9sM7TSGeIv5MmNHB3mprcjGwRVXmTsZwxjCCzsUMzS+l7EtlEXjRCSRxgr1I70
         JydOlv45izuM8lq0rY7WwxAW32zwlU4ZhpUV9EGBGCeXCVFER6QJ1uSgtl3gi4eJ4OmI
         6FZzTKPDSRP6yySRUQe1ahy0LgvocWhJ8qwXhrbmsK0H4BEpxFM/YQjkLKddCTqBFXoR
         Enwa9d4YFYqbYEmFQBGdTSseKQ+AWJNsK/iCwElHIxJgTQTpfQj+pjIJsUHfmHx6FLm/
         nhU7ZfCo6c5htRQM1tzhTAhbiGtDYIzrA1m/woRwVLY61lu039f3kkXHB9lWtEaGKd2G
         33RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hdhi8o/uOWcv18fMCxckchm+UgJLFPrhgXGldfLApj0=;
        b=BMNC8zftxy7MvhrtA8Oi+sSk7OhkCeyPRQ5EUUkqxqHhqTP5YYlJmavPk8w3ze6kLZ
         WYwo50VDzR5ZU7CVuLnQc7X+q5mVl1bRIyLWyaqaeCjlx+X3aoFI+3rNIbM+MsT9WxpR
         qG87gWELyZyizbXzhO6oyjuf1XME8B2hppbxzPpsn1LMJinUJSaeZXTYY50KOkh47Ns8
         nOFGPzcG1LH4f4EflMYC0J5HreMJdcuIoWOt06qVAXCQQqKPtHqbByuQ2rMXKq5DLqxy
         wjwn1wmbFy7pRfj0N9jSqc2SOGl0b3Z/Av3b72xXlYMQCyO9xvTxZeBvgeS/Cmm/2PTq
         5EEw==
X-Gm-Message-State: AGi0PuYaeocX8hvYaAiBeProWCjvmqQaEl2Gf2z9NFugWvzhfBU9uEoM
        YnQvzFpIvqssMdMQC2/NH/M=
X-Google-Smtp-Source: APiQypKDY7D7Ugla8GvkGcOcThXiQDbHYF9zM45CaLEWSa0aMvcq3ZC8x2ch5cZFJoO4NsH7Y9UiBA==
X-Received: by 2002:a05:6830:18e3:: with SMTP id d3mr1034479otf.117.1587593805830;
        Wed, 22 Apr 2020 15:16:45 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm194282ooi.30.2020.04.22.15.16.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 15:16:45 -0700 (PDT)
Date:   Wed, 22 Apr 2020 15:16:43 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit
 kernel
Message-ID: <20200422221643.GA46781@ubuntu-s3-xlarge-x86>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
 <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 22, 2020 at 10:32:54PM +0800, Jiaxun Yang wrote:
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/786
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
> Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> --
> V2: Take MaskRay's shell magic.
> 
> V3: After spent an hour on dealing with special character issue in
> Makefile, I gave up to do shell hacks and write a util in C instead.
> Thanks Maciej for pointing out Makefile variable problem.
> 
> v4: Finally we managed to find a Makefile method to do it properly
> thanks to Kees. As it's too far from the initial version, I removed
> Review & Test tag from Nick and Fangrui and Cc instead.
> 
> v5: Care vmlinuz as well.

Tested-by: Nathan Chancellor <natechancellor@gmail.com>
