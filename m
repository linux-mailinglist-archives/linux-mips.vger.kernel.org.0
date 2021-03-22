Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277B6344CA6
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhCVREA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhCVRDp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:03:45 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2390C061756;
        Mon, 22 Mar 2021 10:03:44 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id m3so7340585ybt.0;
        Mon, 22 Mar 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOljc04t5W0SUG7srUbPvSgsB/FGIZayT6DVZGLWN+w=;
        b=exCPMSiK430a0FW4Meg32jeboSqL0KY5onrZn7kdcsnYhL+//3MXbtq6plUCPsCIpc
         3CtAuVdmJrfpUuMOKNIW5NfsjMpgRTHwxRQ+WmgVrV9LKXWki9qW41ALRo80g4kbCj8q
         X527/5eVBLx4xs9b39g2GacrGKz3x7edcvE7R3otWOyyvpGbFZ0EuWC66TsX4hmqzD9B
         ppsYbB20l9ThMaQpjeHEqJDgJmVU4IG3O5rk6mCOZTIaTWE4IszsppmaqYlUhT16SfQK
         Ne45xB1Tgzr6hVXoynozItYEt9FG3n8GvCqGqc5XxSRL02q/BkfEzG3zl210fOZxc1WS
         ZymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOljc04t5W0SUG7srUbPvSgsB/FGIZayT6DVZGLWN+w=;
        b=o3QACyBLKIfeDX+ulsZIWy7YwklyfNd3sjmmGjLl5BF0ZiNm0458HKBJKPfitr6HBb
         z6kRjaSaGPy1tuhGZjqJL/IvF3Egv5o2lCiVS567rbj3fCNJ7mVQD3MnyAX8F1+3TXix
         LVBaqUHvdwrmpdkBR64CeT0Edvf6tmbBsistpJKg07Tp0eRi4cfvFmvjM6zUSeMTWGzY
         e/Y+UcMif/DNJbTEBH6ga+1dIDZW2wcz4TJ1m5a/Cf1wX3Q7nsoiHSne5c7SWnUk8IWj
         41Pf5DXGg5cIw39unJaLNuxQkqeQ5C3EIYJoIdpJwSucNJGonWMworaW5+DO15l4KeLE
         d2IQ==
X-Gm-Message-State: AOAM533mZl0MNSHGLAtGKS7vQPsADNf4lnopkRetetiIjc4Jjlhxlr8t
        X1lE8XbCPPsc1hKHZ5OBYfwNhdHmhaUVsK4BEFc=
X-Google-Smtp-Source: ABdhPJzXhhzm+9Km3ayepaExYQ/+mSazkf6ZWSZTXcZULZ9qdkRKq1tiyZI7pEJgOr/psRbhdunpq8Yj4+AyuxjBbZU=
X-Received: by 2002:a25:d296:: with SMTP id j144mr643664ybg.33.1616432624083;
 Mon, 22 Mar 2021 10:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Mar 2021 18:03:33 +0100
Message-ID: <CANiq72kFi2-xevrSgd86bNAUdLE4DLYcx_c8GaPeYV90oojz3Q@mail.gmail.com>
Subject: Re: [PATCH 00/17] auxdisplay: ht16k33: Add character display support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Thanks for your comments!

We could use this as a showcase on how to structure and present a
patch series! ;-)

Cheers,
Miguel
