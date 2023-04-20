Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988CE6E98A8
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 17:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbjDTPpm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 11:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjDTPpm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 11:45:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6A0E2;
        Thu, 20 Apr 2023 08:45:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C03D643C4;
        Thu, 20 Apr 2023 15:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C98C433EF;
        Thu, 20 Apr 2023 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682005539;
        bh=RqzPLJRv4Lf5O4O76oH40wEJLKGg6yw+iZXeH5rG4dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=afAw6WGMaD+BqMxQEw8SvFAUttM3QUu8SyfnKbKVc0VpwAMVB+N9ZG+fVy77/GKHR
         rWqcib927XQn66zUS5pm7oEzL7wXtC4/rHCD12g9nVU3JqrrKXCH/2uKVShmX5uzxH
         2PpZpTeSdkjf01sz7bLNUYi1Au7100egrqL99qczKD0PwuS29m0LSDgiZQTaxjsLVz
         AC6BVl54iiJ96LnB+EMYSozkdcoPIh59DuKFxSnwTwoOkLLaW1UpnEHdaLzRPyKL8+
         9F6/JK3hVTSkmysyWcVD7EHl3JcsJlM9bdmXr5CVfGxOdDhL/Nv4/hruWBkr8VX2ux
         ty9OD1smfOtKA==
Date:   Thu, 20 Apr 2023 08:45:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Phil =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: mips: ERROR: modpost: Section mismatches detected.
Message-ID: <20230420154537.GA706381@dev-arch.thelio-3990X>
References: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Naresh,

On Thu, Apr 20, 2023 at 04:31:12PM +0530, Naresh Kamboju wrote:
> Following build failures noticed on Linux next-20230419 for mips.
> 
> Regressions found on mips:
>  - build/clang-nightly-allnoconfig
>  - build/clang-16-allnoconfig
>  - build/clang-16-tinyconfig
>  - build/clang-nightly-tinyconfig
> 
> 
> arch/mips/kernel/genex.S:520:2: warning: macro defined with named
> parameters which are not used in macro body, possible positional
> parameter found in body which will have no effect
>  .macro __BUILD_verbose nexception
>  ^
> WARNING: modpost: vmlinux.o: section mismatch in reference: check_bugs
> (section: .text) -> check_bugs32 (section: .init.text)
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> make[2]: *** [scripts/Makefile.modpost:136: vmlinux.symvers] Error 1
> make[2]: *** Deleting file 'vmlinux.symvers'
> make[2]: Target '__modpost' not remade because of errors.
> make[1]: *** [Makefile:1978: modpost] Error 2

Thanks for the report. I sent a patch for this yesterday:

https://lore.kernel.org/20230419-mips-check_bugs-init-attribute-v1-1-91e6eed55b89@kernel.org/

Cheers,
Nathan
