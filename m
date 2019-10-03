Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2037C9B63
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 12:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbfJCKBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 06:01:20 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46552 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbfJCKBT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Oct 2019 06:01:19 -0400
Received: by mail-vs1-f68.google.com with SMTP id z14so1249148vsz.13
        for <linux-mips@vger.kernel.org>; Thu, 03 Oct 2019 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g7o/eWbmZMF7tghY7GsYEgJqo9ZWWmUzNSO/fUncz0A=;
        b=Xh8EMbKY8aUMNCtd9DUk/0wH/Cr5O1kZc86NxICkCkr8/5PS8F6GlN+2xs/2vC4dRt
         ty6r0pI4DfdkBIGyf6NOHIOalxh4X7molyh8nDuemr2wIlG1iOjJph8u57o+djetShsw
         Kj/3UVZnZ5QOlYHJk7wQjcBrHqwGWCCqfUUK9DFrPxWL8a8F6nyvKqxbesZcVtcYsLm5
         NScs9MRfxVTUalFccr+KrbLArk0aUbbHEsoVQVQGSZOSXn5SIYwZikl3ey2zRAru/kfq
         o9Mb1VVopEMb9ew/nbeSwZnf6LsozSC7GavxSyBodf7NtSsDCx29YO3o8vkfL/P8gVU7
         /Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g7o/eWbmZMF7tghY7GsYEgJqo9ZWWmUzNSO/fUncz0A=;
        b=ghSTQcvArhFDJiIqB992LPcKvjGyg1zORKbGGJAdHIP8lR2zuYu/dq64n1Jf/73hH2
         lDD1LD1o7Uk7Dfp8RWgDy0zGgWQ2O/oh7zrdahqxJZBL49NwX38Pe+0iI3D2yI3OHz4w
         RTyh5Kt8MO7s+PfFE10IJ5YfBJvflnUgl374QWVLsDNKtyIvFyXmtHE6b2emaZHLROHF
         i0IagfWukCz6K3bjm1f9TUkuxZWrkGnviVreWa2jR6p4EnFQAdeyqFN1iQww4toRY4lB
         vtdPRFekaPZ+8YTBORPZ8OQAtgtYQsaojivV9CQsI3uAlsXSbAjUThJgJhJXZTVLLa4N
         otjg==
X-Gm-Message-State: APjAAAUc/vWTegUZME+3QGToHPGsbTaGU9W6F9GIQu+JbJRbHk623+j9
        zicLJ/GQQMpSFzzo3+9Q47UokzA6XLvLWrJCXjcOJQ==
X-Google-Smtp-Source: APXvYqxL07NmXssn+CMHMD5w5w42iHOG7BGWk291TkCuQfaiwZmMl3OFL+eI+fxDOQEw+ydwytxswi6ADkBUqx8K79Q=
X-Received: by 2002:a67:fc42:: with SMTP id p2mr4559906vsq.34.1570096878598;
 Thu, 03 Oct 2019 03:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com> <1567669089-88693-5-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1567669089-88693-5-git-send-email-zhouyanjie@zoho.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:00:42 +0200
Message-ID: <CAPDyKFo0aR2fhCd8qCNAf7hoXSjV+9vG1BqB6vEM=B9Vpmpovg@mail.gmail.com>
Subject: Re: [PATCH 4/4] MMC: Ingenic: Add support for JZ4760 and support for LPM.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, syq@debian.org,
        jiaxun.yang@flygoat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 5 Sep 2019 at 09:40, Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>
> 1.add support for probing mmc driver on the JZ4760 Soc from Ingenic.
> 2.add support for Low Power Mode of Ingenic's MMC/SD Controller.

Normally we try to make "one" change per patch, unless there are some
good reasons not to.

In this case, it seems like you should rather split this patch into
two separate pieces. Can you please do that?

Additionally, please change the prefix for the commit message header
to start with "mmc: jz4740:"

[...]

Kind regards
Uffe
