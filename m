Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F876175D16
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 15:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgCBObH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 09:31:07 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46277 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgCBObH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 09:31:07 -0500
Received: by mail-wr1-f54.google.com with SMTP id j7so12773135wrp.13
        for <linux-mips@vger.kernel.org>; Mon, 02 Mar 2020 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVkSHfK4YHqT9nqvUcfiAIElTFwC2lhrggG5rptPEH8=;
        b=jcaey9IbCgNEqaATmD+e/XUbe+DKBoE+STRLDWsg6hUqKnhcNvnkkzJcdDRf25ZG/j
         YzVtYAIXusd2U7SdlfuZ2isDh+rcL51tdgddTutt6CuIq8K/+b13xCrmoSYb0u5a2jyQ
         fFkcHIlXu4vjJaLdWJ517jwXwbkBKNAIXk4PtQB7ah6NMUyYDb35z8ukJyuSs6Uy7DIF
         JDnMwnvuKUKqGNFlPieX26Wa3sy0F0tuOO30T76YKjk/cUkDj9nkWUO7+OZ5PbGO85s3
         1V7ji2h7yBLVf9AtRiRB6FmcJgNPQ9rOaeMq39OnNFzj/iqVL6a4KO7egr4NAmwDq5Es
         ISJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVkSHfK4YHqT9nqvUcfiAIElTFwC2lhrggG5rptPEH8=;
        b=hbYkJVHxmKrFJ/FAGyvpQFnKMJ3g4i5IP7cT0NWOtlrcAAXlDey7C6e97Ui3avbwvN
         9K4KXzsjYFVnVgBJ449UDPg0VltGpa8XIZFeomg5IN8OQ5khDQo9igiG8QwqAYv1tAXY
         P1cSTfEjv/tebxKF8ODGn+mJL83Sg8dHHaUArkqpBxqySEqTHdrqcVIHSjOLeOKH4RCg
         KWEZ97ic2uKbSKqXiXFHEpALMegQXesnF8m0Rtcis0YR/Q412/O0KxL8wQi0ooUd5H0M
         PqHpXHmjxjIaBecMc70aBdwMyC71Uv5B2fwoge/thkUtRpZkPTIuz8lXasBBo+cHAabo
         1dtA==
X-Gm-Message-State: APjAAAW4/rAl8iWvapddK0pmbVhWvNwkHDv/1l3SzkjUKHVDEALbXkR5
        3kX/P6lm2brDAalKP4+SBHU7WrKDx8JRpNXITpk=
X-Google-Smtp-Source: APXvYqyOgIrEOnjm/peAbV+dFzni/hAiSad7twoAi56KM2qWl+jfFDeYkw9vPRrlZ9nPwIsqrIQohlUtQ3rgjg6qcQA=
X-Received: by 2002:a5d:6cb3:: with SMTP id a19mr24072860wra.213.1583159465011;
 Mon, 02 Mar 2020 06:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de>
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Mon, 2 Mar 2020 15:30:53 +0100
Message-ID: <CAOiHx=n99CyGKj+bnR_gr+SKXB45RF3A+RsQfbS87OZJnqYOGQ@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, 27 Feb 2020 at 15:49, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Hi,
>
> we have 47 MIPS system types and I'd like to get an overview how alive
> they really are. I've already grouped the 47 systems a little bit by
> hardware I already own and regulary test kernels. Could you please
> give me some feedback about the "unclassified" systems ? What systems
> are supported by qemu (real test not just repeating qemu docs) ?
> Thank you for your help.
>
> Thomas.
>
> Unclassified:
>

> Broadcom Generic BMIPS kernel (BMIPS_GENERIC)
> Broadcom BCM63XX based boards (BCM63XX)

I own and use mostly the latter (which is partially also supported by
the former), with the occasional fixes and improvements sent upstream.
BMIPS_GENERIC supports more than BCM63XX based boards, but I only have
the latter.

The long-term goal is to replace BCM63XX with BMIPS_GENERIC, but
feature parity is still a bit off.

Regards
Jonas
