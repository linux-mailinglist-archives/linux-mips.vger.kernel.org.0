Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA3E5960D
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2019 10:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF1I1e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Jun 2019 04:27:34 -0400
Received: from mail-yb1-f176.google.com ([209.85.219.176]:42516 "EHLO
        mail-yb1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfF1I1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Jun 2019 04:27:33 -0400
Received: by mail-yb1-f176.google.com with SMTP id w9so3271500ybe.9
        for <linux-mips@vger.kernel.org>; Fri, 28 Jun 2019 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZMyGtFJEbUTcGKieCaj++uI+gy31Rm8KDFe4rm/po2w=;
        b=UQs2pFMEzP/rR6vJLstcGYeT/Ty7l/vdxKoFeu2948dc0JSiadtt3xT3oV/+DycAgu
         /57icHTumZ/9XZS5Bp9yjMVX4heWIQD3jD0lLRiLprcqeXMbsv/Yd8EUORMhoy8hGt6a
         ws+/mD2UjkYI13H4DDtXLxtpJN+N1WCY/L3i8+09dBPaLYsyQSq890qk5OeKOxE89PjO
         9OQJgeXLstC9k9uxE92Z+jI//YwAEiRKTlafdSJoRJ+WgKUWl2isEpMlsbT/TtPimY4o
         QisXcMjropkBzbC7is2gaoW4UDeDC9zvXAYORuTJWrXNPWCLN05KDPrv2nmgCtBu0ErZ
         XK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMyGtFJEbUTcGKieCaj++uI+gy31Rm8KDFe4rm/po2w=;
        b=pVd0/fxWi2OPlp3qHDZ65WXuY/4fKZu/eS1+gtSCpfAVtv5dZGXX07uiIDUvzhn69G
         s5S9o99+cRNvluthjEYwPCYq94ZYgk/C2Txye6sfNxVwS+LV5zl5HYX8S2wsiErP3ccn
         L8hqoHlyqkR+ssfcCCYomFYEN7mAlfEqECZKHqJkIiPxXna8k7vG1R7wHlGYjotIJjUd
         BFMT3VCiuXAZflL4EoWWqTGaJs33hJUrn6uXS8NsBIJFopevAuJdLgLWPR8BpARl5JKx
         zsG6nChc3ZenDF49Rw3z57pgSOSyVx2p5G2wyxFT/i0UwkkjwewpXrYehBflMm71SJRz
         IA/A==
X-Gm-Message-State: APjAAAW51EYFk5w2hxCaZjhvISeoJfdtPGQ1H4m1UQxhUEuyJC1+hlI5
        0CP48YiwbB6UA/tV3TP4rhABBdBSH7B+i4gHjIo=
X-Google-Smtp-Source: APXvYqx9ZrLvkZKHwwg4XUoogmJ8ilgvLEqoQo7lM3GY4iIvOSkGlRbwQAIfbc6Uzp12NLbWVKUxP+Bw70wf8FnAB0E=
X-Received: by 2002:a25:8306:: with SMTP id s6mr5374447ybk.382.1561710453119;
 Fri, 28 Jun 2019 01:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com> <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
In-Reply-To: <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 28 Jun 2019 10:27:10 +0200
Message-ID: <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Matt Turner <mattst88@gmail.com>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

guys
I have just tested the shoehorn in SlotC: there are quirks, but at
least the kernel doesn't panic

to summarize:
ShoeHorn in XIO-SlotA: panics
ShoeHorn in XIO-SlotB: not yet tested
ShoeHorn in XIO-SlotC: doesn't panic
ShoeHorn in XIO-SlotD: panics

- UP -
A | B
D | C

ShoeBox: doesn't panic
