Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4035A59B0
	for <lists+linux-mips@lfdr.de>; Tue, 30 Aug 2022 05:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiH3DDE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Aug 2022 23:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiH3DDB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Aug 2022 23:03:01 -0400
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E609A9C517
        for <linux-mips@vger.kernel.org>; Mon, 29 Aug 2022 20:03:00 -0700 (PDT)
Received: by mail-il1-x149.google.com with SMTP id d18-20020a056e020c1200b002eaea8e6081so4243512ile.6
        for <linux-mips@vger.kernel.org>; Mon, 29 Aug 2022 20:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=2XaZZETii+6PIf9IdmpIQGt4a+rcs/HHiKkWECCIB48=;
        b=fVhkee5EruLHw0LuUU8nVIUn3apOeMRuR8SY0+hDJXdTMaqwvdegea/UoD2cRiVLNO
         t6aDgCyXGOlhyi4qDRp21TyoA228FyeP/ois6XWeqkpUIDsxaXIjk8Gvt2uSoUEF4oda
         uCtjAnZd60hT7i/QH64FDXTXLCCWeZw/TIRSktNN9nd6ioibWwPNDo5tUHgMgpH16jTA
         G0yDyCz//JyWqG2tXO9ITBiIYZK8odAOUlw/klgGoIrs0BG4caQsdm2EyaCwZgHOE1H5
         dFjrJ38bOMRFY5fyn0y1xygNZWzhe9Qqb3BgivjIZFuimahoaodu3iqX3abexciV4XZH
         ly6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=2XaZZETii+6PIf9IdmpIQGt4a+rcs/HHiKkWECCIB48=;
        b=Z46mqvc21sGtGRE0GmwN/MrKH6NFASRLrb9rI7gmB6zBWWyKK3LGiXfXlUAVGucYLb
         oTqJJHe6JiJV0VysXirxptfoCMx446d+P52vRgsuJfa7K5qbL121KDqn//bCGcXk8lO7
         Li5DUvXvAZRC5DI3Spk8Om463JaxsROOgiilkNelYbWB2i9zuGVHxee3yaXQGK25cu1R
         IDvGRbsoJi6662QgEnBctLZNrX2xXWQ+uTH7SovUFXl0jLu08yoNL6xWsvocqhonmG2X
         QHaNfWUseAJZTA1TcZwb4HmAIJKWmWMlH7A35MOWVOqD8IvpQEztSJuDl6Zzu/0TcTuV
         iGoQ==
X-Gm-Message-State: ACgBeo0gIXHxYpu0JoXZLhRFAOsxN5ylx26TniFvOXRo/LRsjJZNmGuU
        B9V4a65xBaN+sWEsE7LA6Sdc3uCBh1c=
X-Google-Smtp-Source: AA6agR4Q1pBH1awKjioD9X7zEwd1kxWatig/+Lk+rvnUkBqPRrClpJvtSPWcXgWc+2IALshWGb51jxjpTno=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:3049:2153:3017:38c9])
 (user=yuzhao job=sendgmr) by 2002:a05:6638:3805:b0:349:ffd0:9a86 with SMTP id
 i5-20020a056638380500b00349ffd09a86mr11183833jav.227.1661828580358; Mon, 29
 Aug 2022 20:03:00 -0700 (PDT)
Date:   Mon, 29 Aug 2022 21:02:59 -0600
In-Reply-To: <20220725091740.28188-2-alexander.sverdlin@nokia.com>
Message-Id: <20220830030259.3503212-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20220725091740.28188-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: Re: [PATCH 1/2] MIPS: Introduce CAVIUM_RESERVE32 Kconfig option
From:   Yu Zhao <yuzhao@google.com>
To:     alexander.sverdlin@nokia.com
Cc:     cminyard@mvista.com, joe@perches.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This commit produces a bogus error message on systems that use the
default value. Please take a look.

Thanks.

  Linux version 6.0.0-rc1 (builder@buildhost) (mips64-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0 r19590-042d558536) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Sun Jul 31 15:12:47 2022
  Failed to allocate CAVIUM_RESERVE32 memory area  <<<===
  Skipping L2 locking due to reduced L2 cache size
  CVMSEG size: 0 cache lines (0 bytes)
  printk: bootconsole [early0] enabled
  CPU0 revision is: 000d9301 (Cavium Octeon II)
