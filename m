Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC6A7709AB
	for <lists+linux-mips@lfdr.de>; Fri,  4 Aug 2023 22:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjHDUZW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Aug 2023 16:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjHDUZV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Aug 2023 16:25:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6804C4C28
        for <linux-mips@vger.kernel.org>; Fri,  4 Aug 2023 13:25:20 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so1711687b3a.1
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691180719; x=1691785519;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex6SJL5ObDCLYDGyNPx7YXwKOtkLAUgNmeobSlPYnBE=;
        b=UcIFDyR+i55HVlfkDftoW/Ims0Gy/G+5LWHsj20SfwItj/Ax5ODuIEwGNcXQef11eo
         e6B7HYLQbLqeDUc0H8bUrbGbrF1K8fRev9v1eGY6rfJje6VMZceNsby7/+PA94VqXLHV
         1Ore3EYxCr8MNeofzjWsE7hjJ0AhDlwel1e+4SjqzQ5t66WHsBLxfhbO05R8xXJtaf+b
         a50Fg/ZpjLf5sP5LBCOo+wUHSpi21nzNLmlabt+hPQfD03Ll+yMsIvz3k9e/KH+FIBDP
         iPwHogoRUKbFkTy0yR/fKXCnVr+Xo0G4kzeLbveWwN+diwFA712kFN9vSh68OW4mYRTr
         IeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691180719; x=1691785519;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ex6SJL5ObDCLYDGyNPx7YXwKOtkLAUgNmeobSlPYnBE=;
        b=BYAn1MSYeFwEOSa4BAbr+0+zifBEEfq8lkoWLGtswRm1E5qAYDaiFsS5cAj1bp5Mu6
         hLesupMKvlFotr67Gy0SJUiQ+ffHyiMvlYkmmB0adYj5T2czbWS+U2UeRuqTzMaVBjGf
         daNuStTORycUZjGobYBz1u40t+u0nLwxPpbm8oqjpw6rFF9Ms+xP7BBKWDJCIFiVsVNh
         bAw0MzGQiJK25D7ZZaT7lDmU9A2J+jrIqN9r6HfDl9Qpk69J7vY9oi7kzD7NJcFSl5kk
         kUEqI3QFg5w9YReUwI8s3yaMDqzSWkehiqX6454a/aofqpD7n4O14CyykLi++x5v1LT7
         /B7A==
X-Gm-Message-State: AOJu0YyZG5K3TF9Nj0mk5X2j2Eo9AZGYWSpwqyYMgWpHv1IR+5wasLqH
        5As0YAWnHOCmLpt6PyUcTZEjwePrU+2l8g==
X-Google-Smtp-Source: AGHT+IGXP87lDugbvg4mFpn87ITO+f2PzHt9E/PsgwaeruldqfwSeUhyM2TbLJB5KVYcCkM5HAFEcg==
X-Received: by 2002:a05:6a20:3c8c:b0:13e:90aa:8c8b with SMTP id b12-20020a056a203c8c00b0013e90aa8c8bmr931491pzj.4.1691180719195;
        Fri, 04 Aug 2023 13:25:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m10-20020aa78a0a000000b00687862a3f7bsm1935415pfa.204.2023.08.04.13.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 13:25:16 -0700 (PDT)
Message-ID: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com>
Date:   Fri, 4 Aug 2023 13:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To:     linux-mips@vger.kernel.org,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Content-Language: en-US
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: soft and hard float n32 and n64 binaries getting illegal instructions
 on Cobalt Qube2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

A number of programs built with the n32 or n64 ABI running on a MIPS64 
are getting an illegal instruction, not right away, but typically when 
they send/receive across the opened sockets. Trying different kernel 
versions: 4.14, 5.4, 6.5-rc4 does not appear to materially change 
anything so it must be within the C library/toolchain somehow.

For instance, ping gets an illegal instruction right away with 
soft-float, but works in hard float. iperf gets an illegal instruction 
right away with soft float, but can exchange one chunk of data in hard 
float mode.

This however is not happening with udhcpc (busybox's DHCP client) which 
is also a network program.

This is seen with both musl-libc 1.2.4 and glibc 2.37.2, both use GCC 
11.4.0. This is not seen

Unfortunately gdb also produces the same illegal instruction so I have 
not been able to get much debug so far, any hints or clues as to what 
could be wrong?

Thanks!

Buildroot configuration: 
https://gist.github.com/ffainelli/08baae86281aa4a6b4f71de8049ca27a

Kernel configuration: 
https://gist.github.com/ffainelli/83d16fe47b8daab00aa39f5d2bb1f2ca
-- 
Florian
