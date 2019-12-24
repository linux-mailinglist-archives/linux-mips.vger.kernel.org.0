Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E09C12A1CC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 14:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfLXNhY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 08:37:24 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:55361 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfLXNhY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Dec 2019 08:37:24 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd6f0d0b;
        Tue, 24 Dec 2019 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=gEFNMUQrn8pc8q7jFRWms1pimpI=; b=WDGKIy
        18ogApN3mCCt1ei3p//f+ODjeMeU3WEm0RkKAoGy+68nFuZxrzurmv9TREQ425T7
        RpVjDmc/IYlHa50bSodtQ1kzbbyvtzOAaJUxRv2S6WRD9Yx1cAgIQ1kS50EG9Y8T
        j9bEHGao9dOOlL5dAdEruj1Lt9lc52YYE0z42eDdJjNWIC8uai8tFCiQP7Zs1PE6
        iyzGPbinUxXEOJzWv2FyzmTjAHvC/iLj3JJpgebaY5ibaCJZHuNDx1w1y8G3OODu
        rNhdtcv/gJa24gEDPbAimM7jGpJSZmE3OY2yDJ1LmpBNEpKLB6HkPoxBHQX1lfWR
        LwJEsshUu/l/k2tg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ce5fc91 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Tue, 24 Dec 2019 12:40:00 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id k16so21816731otb.2;
        Tue, 24 Dec 2019 05:37:21 -0800 (PST)
X-Gm-Message-State: APjAAAUcN+P8AMsvGeAXADpuXyuqubZ56t0wGrXxH9CB7vHeOeSbRvVA
        Drdbc9eDdMRWpHu7B0pLTiVmE+LgK44SLlASnUg=
X-Google-Smtp-Source: APXvYqwA4ZpN4V1E1okXO9b7enh8BI8YYtzeXZSuuTUBTw1msLneUGfzOnPjzlaKoJlvPA239aAuvu2XKas/sZFE5xE=
X-Received: by 2002:a05:6830:1141:: with SMTP id x1mr39295818otq.120.1577194640368;
 Tue, 24 Dec 2019 05:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191223232945.a3sbzfj6uw2sokba@lantea.localdomain>
In-Reply-To: <20191223232945.a3sbzfj6uw2sokba@lantea.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 24 Dec 2019 14:37:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9qg8+xdM7Uo=XydwsOV27BWYK8fV44oimqiosBvH_-UDg@mail.gmail.com>
Message-ID: <CAHmME9qg8+xdM7Uo=XydwsOV27BWYK8fV44oimqiosBvH_-UDg@mail.gmail.com>
Subject: Re: vdso-related userspace crashes on 5.5 mips64
To:     Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

More details forthcoming, but I just bisected this to:

commit 942437c97fd9ff23a17c13118f50bd0490f6868c (refs/bisect/bad)
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Jul 15 11:46:10 2019 +0200

   y2038: allow disabling time32 system calls

   At the moment, the compilation of the old time32 system calls depends
   purely on the architecture. As systems with new libc based on 64-bit
   time_t are getting deployed, even architectures that previously supported
   these (notably x86-32 and arm32 but also many others) no longer depend on
   them, and removing them from a kernel image results in a smaller kernel
   binary, the same way we can leave out many other optional system calls.

   More importantly, on an embedded system that needs to keep working
   beyond year 2038, any user space program calling these system calls
   is likely a bug, so removing them from the kernel image does provide
   an extra debugging help for finding broken applications.

   I've gone back and forth on hiding this option unless CONFIG_EXPERT
   is set. This version leaves it visible based on the logic that
   eventually it will be turned off indefinitely.

   Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
   Signed-off-by: Arnd Bergmann <arnd@arndb.de>
