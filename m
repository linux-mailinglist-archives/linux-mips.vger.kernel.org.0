Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547033C9847
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 07:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238538AbhGOFWf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 01:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238265AbhGOFWf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 01:22:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103ADC06175F
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 22:19:42 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id p36so4011185pfw.11
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=/pAsgrjkhwRlFe+I2P3blIZZFdFGN80o5OyDElqgHIY=;
        b=dNdJE68w6sqtlWMNIVHRvxSCCZ8E6CeYrYMGD3VrWs/yA4Bbm/iYG6KudIqPyVxku6
         AN0AjgfhD/DZ603q5NbTBtjPf+oXS/lkKihBLQIExu1EJUbgwhJH8wKe0w8gtjAqCAAa
         j7Nx2icA/zJ+Q6v5TNOOy8DtEkCR4mBPUBTkragfaEB79CSPIhRSzu0IchWHOJmLnkgh
         ueCzSuQjZlccggQTdzgGFPmvioOD7IoIk56Ze5BhET1FrWgt5HawXWf/0Ao3+eMTSAe9
         bjsbeu5wQFh9aFtrlmFwPX2T6tZDwer3s3VLau5y6rl0lVZGQo0hEQaevih5sW1cen+O
         emug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=/pAsgrjkhwRlFe+I2P3blIZZFdFGN80o5OyDElqgHIY=;
        b=mtbI98EUUhrxaEzYjceFK3xlDETy8gIkxdMyMdKzLFi5GiNu5FCO8uz8VVpqJZAxwx
         dQ9qfsUXr4dSlanWKXMpKvbb8igQMTE5WtiGYIjj5UNvgV5GoUCN57VpfQFsgszMWIiW
         rK89kUteH90LmRMn1huxeH6gUvRDAHaKyBlpuLxQItCg75bthKMS1Lk2Cn1aE8as8CdS
         k7S5MLlzfXkoUtU5atKv1tC1gcOV2VH45reA87XhmlZjgjwHh4kfWx4SHoexU5Y0ttEN
         Clumg8wfneFSDXCX7Jl4CKBREsrlvd9UG3GSPdu1t/dZ3vCiD8js5nnwVLVcfBf8Z1kR
         QLvw==
X-Gm-Message-State: AOAM531YU3F4Ckfnmaa5caIpkPFwyVqGG2UZj2g/PMt3EW0TXW3xySdC
        zxDII2PJxUCQfn0NX/pjHls=
X-Google-Smtp-Source: ABdhPJwvwqZwOLb5crnpUeHQvcJrLeaHiQKqDBTV4ygdTK0HzqeRZyo7A0b3pl+Pa/a2ISJAIo9XxQ==
X-Received: by 2002:a63:ba48:: with SMTP id l8mr2454053pgu.259.1626326381539;
        Wed, 14 Jul 2021 22:19:41 -0700 (PDT)
Received: from [192.168.69.120] ([171.6.237.160])
        by smtp.gmail.com with ESMTPSA id 123sm4861822pfw.33.2021.07.14.22.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 22:19:41 -0700 (PDT)
To:     linux-mips@vger.kernel.org
From:   Strontium <strntydog@gmail.com>
Subject: Random Hard Lockup starting MIPS32 kernel with kexec.
Cc:     paulburton@kernel.org
Message-ID: <a5093c5e-bc3e-9db7-023c-e1872f99867b@gmail.com>
Date:   Thu, 15 Jul 2021 12:19:35 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Back on 22 Sep 2015, Paul Burton added the following patch to the Kernel:
https://lore.kernel.org/linux-mips/1442945538-26141-7-git-send-email-paul.burton@imgtec.com/

I am trying to kexec a mips32 kernel on a MT7621 target (1004Kc Cores). 
The target has two cores/4 threads (It is NOT the single core MT7621
variant).
The Kexeced OS is locking up hard in this code, randomly, about 30% of
the time. 

So the boot sequence is uboot -> first linux kernel -> kexec -> second
linux kernel.

Its the second one locking up.  The first never does.  This is the output:
[    1.891609] Waiting for core 1 to start... STAT_CONF=0x4a0504

I can't find any documentation on the CPC Sequencer, so what state this
is, and why its stuck is a mystery.

I have tried analysis of various GCR and VPE/TC state registers but i
can't find anything obviously different between when it doesn't lock up,
and when it does.

Can anyone assist with an explanation of what that state means, and
where i should be looking to find why its locked up? 

My company would also be willing to pay for assistance in solving this
issue, as it is a high threat to our product we are developing.

Steven Johnson

