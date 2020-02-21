Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B49168010
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 15:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgBUOVp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 09:21:45 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34887 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgBUOVp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Feb 2020 09:21:45 -0500
Received: by mail-lf1-f67.google.com with SMTP id l16so1624259lfg.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Feb 2020 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LzKEMSRm7aMhbsD4FLHQVZNBKfPqY5ZNIMagLE7b27A=;
        b=zsnxq6A6AvCzyiGsP5PWzf+udVD1jQS/2saJCH+nR88fIRw0unQSUP++Rkfd5sfrf3
         63Odo9vcMh/eXewq38ibkJ1zAQ2XWX6dpxB0JJcPabvSmgDjJRC5Kou7PPy1Y3opByhh
         KSkTfPDsfmJB7xZ3BMmTpBKdQdz89FNs56yBrqtEQKqZY6vbtZWVPk/o8YuLpInm92zK
         dqqaq61KzXrF7vBNf6jnMFIX0Sxnwqi5aFvV7T4nAtFd9Lf37IL2QKH3yC7R5ZlOo9KZ
         9hhyJZtlyOTLlKFquzaoF4vwjdgdZZVrqiCHqBBKYBYpRAAedbT45Vu3fc79G6DiNgPM
         4sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LzKEMSRm7aMhbsD4FLHQVZNBKfPqY5ZNIMagLE7b27A=;
        b=tIPcHQ7fvrJHzTQIzWWR0UFRDDhsgebqLYv01mLWhhg03S5uAtXz40T/rMZxAABES1
         wMmsjzIEjfUZyDO6ukaN/8fRRHAqaQHO6BdSVL0cXBCrAIPa1ihok5WbltIhvZeNdH41
         o+gmHQy0FOcQgOxf74+xboV5bRze8jNQQEeswhs2tIjr2MLkl1JvKc7y7/acou9kIM+5
         D5hhlWdQtUNYz9fjN+x4CQDsqPnqVm9r4jikeDzVaQ40F1jT4yyay4bajrrOrpMTcwnt
         zHlzhLEmvQWt/WLEh36cDahLvm6q3UK8RVwmjNU53zSwlJd7qWdViMSzW++91yHsHms8
         M8zA==
X-Gm-Message-State: APjAAAU0TRUJ7tVuKp6N0G1urn59qgD8ot3VA5J9U0pa3Mn1Lf1442Il
        8SDHzibOLVCJx8zSGPXwSU4Oo7OKZ8ogWShFWrIM1w==
X-Google-Smtp-Source: APXvYqyW4oBegi1hgs7WkmxGYjpV5GzFLky4el1v6dyD6KVQEdFEh3C2ql6oeVhPQ5VbCKKZC+kBcUpA3K20qa7gUd0=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr8132945lfm.4.1582294903260;
 Fri, 21 Feb 2020 06:21:43 -0800 (PST)
MIME-Version: 1.0
References: <1581851828-3493-1-git-send-email-zhouyanjie@wanyeetech.com> <1581851828-3493-3-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1581851828-3493-3-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:21:31 +0100
Message-ID: <CACRpkdbvc=HtaFnWHOhD=HquNCpbL04-6tTZ8yqwHBQcK+8tHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Ingenic: Add missing parts for X1830.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, dongsheng.qiu@ingenic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 16, 2020 at 12:17 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> Add lcd pinctrl driver for X1830.
>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Patch applied.

Yours,
Linus Walleij
