Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A2A734CB1
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 09:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjFSHv7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 03:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjFSHv6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 03:51:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA75137;
        Mon, 19 Jun 2023 00:51:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D081A61529;
        Mon, 19 Jun 2023 07:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC68C433C8;
        Mon, 19 Jun 2023 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687161115;
        bh=wcUFCTgaQzOZpExfHFs7UPcmfiTCw61/ZsId+1DngaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDhMTQB+nLNSZH8KLJtCtru9gT8PJM8FnYCvCdr9lTYVhknLTaa+dPsLi4e6qNBCX
         wU1nhHPF7Ec9b9CXy3F7EsHFXvs9FvGrslHnW9cuIt2cSC2jox/Q/7n6KrHtCt529L
         +YudYYV0R7X75c5CVWQ5XXje2fcVTPxeN3m2l1eU=
Date:   Mon, 19 Jun 2023 09:51:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     sashal@kernel.org, ndesaulniers@google.com,
        naresh.kamboju@linaro.org, stable@vger.kernel.org,
        llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 6.1 0/4] Update as-{instr,option} to use KBUILD_AFLAGS
Message-ID: <2023061934-scuttle-unveiled-1801@gregkh>
References: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 14, 2023 at 11:04:34AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This series backports commit d5c8d6e0fa61 ("kbuild: Update assembler
> calls to use proper flags and language target") to linux-6.1.y to
> address a recent issue caused by a change in behavior in clang:
> 
> https://lore.kernel.org/CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com/
> https://lore.kernel.org/20230612185424.GA2891387@dev-arch.thelio-3990X/
> 
> While that was not the original intention of the aforementioned change,
> it ends up resolving the issue for the same reason, by not passing flags
> that are not supported or necessary for the current language target
> (KBUILD_CFLAGS for .c files and KBUILD_AFLAGS for .S files) when testing
> flags for that language target.
> 
> All patches except the second one are direct backports from mainline.
> The second patch is a stable specific patch because the upstream
> solution could break stable due to the minimum supported version of
> binutils in mainline being a newer version than 6.1 and earlier; it
> chooses to do the more conservative fix, which was alluded to in the
> changelog of the upstream commit.
> 
> For now, this is just a 6.1 issue. If the issue occurs in older
> releases, I will send separate backports. If there are any issues or
> objections to this series, please let me know.

All now queued up, thanks.

greg k-h
