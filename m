Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0865207D9
	for <lists+linux-mips@lfdr.de>; Tue, 10 May 2022 00:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiEIWiq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 May 2022 18:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbiEIWik (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 May 2022 18:38:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE862B9CA2
        for <linux-mips@vger.kernel.org>; Mon,  9 May 2022 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ygBTFGI9xn0kSSBDSTM0A5E3qhOAa1leBmJIwJjJI8E=; b=QMmApyGDcMsGVaqgrgFrIiq55h
        AYVtlCMkbzq55b4v9hytyHTPJkHEdVDv+fpuHaeDVYrz2bozqx9NvFMTfjgtrvpSGncjAUQTy9MQ5
        udSMdTRt9li/NOdDpM61mfQ++NdggPaSApqzHBKnE1Sb7P6ES11u1zxjYx+vH1Gf+OESK6eHdUsC0
        4KwjgyO0Cq0Ryg90NZVijKqRE8FbYEXgFardjvT5Ni821JYaJvAgm8BwZWqPEh1tidwCCP5yEA+wf
        VRaeoKY6QE+TeCwJ39WqbxUK8h6Kb4qSlvi6pMHuyoPcsoRWEX2JR2CENkxkmQ6fghWR5GHy2QZVx
        +osLKETg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1noBxa-00GaNv-VB; Mon, 09 May 2022 22:34:34 +0000
Date:   Mon, 9 May 2022 15:34:34 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     kernel test robot <lkp@intel.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org
Cc:     Aaron Tomlin <atomlin@redhat.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [linux-next:master 1238/7959] mips64el-linux-ld: warning: orphan
 section `.ctors.65436' from `kernel/module/main.o' being placed in section
 `.ctors.65436'
Message-ID: <YnmW+il1s2TKKh13@bombadil.infradead.org>
References: <202205022005.yeXAj5Zz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205022005.yeXAj5Zz-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 02, 2022 at 08:06:59PM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    mips64el-linux-ld: warning: orphan section `.ctors.65436' from `arch/mips/kernel/signal_o32.o' being placed in section `.ctors.65436'
<-- tons of these -->
<-- snip -->

> >> mips64el-linux-ld: warning: orphan section `.ctors.65436' from `kernel/module/main.o' being placed in section `.ctors.65436'

This is not due to the changes, this is just that the linker for
mips64el-linux-ld loves to complain about these for any new kernel
object.

So nothing will be done or can be done as far as modules-next is
concerned.

  Luis
