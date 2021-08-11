Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276B33E8EF3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 12:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbhHKKsZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 06:48:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:34876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232644AbhHKKsZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Aug 2021 06:48:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9053F60E78;
        Wed, 11 Aug 2021 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628678881;
        bh=xYgnW6GKpe7B16PTBfB7hhq82Lr5SW7l3TtN+WaINkM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QnBiGODFjPOnuHARymzRkOPEO0iuhRXJ8JXcvcS7ggufrsRsUH6gbfTQ4lIY8Jr1b
         EL+BThFwEaMBXmHBbWPM83WhWER+Jw1OxvDDblbw7GTHn5WXJNEGkDnPOZQss5deyR
         BE/mtZw2jFotLgkcmLOWnh2njuLQCJ2GcdoNPCV4Ss968C76K2Ku6ur9gT2KFafjVD
         xe/O1bHPnvI1DJP27wB4ZoQPVghS35tLQ3pIBh0hjun9+0SHyxbmlSrLFCm/ro9BB+
         KK8sabJwbEug+PxbMEA0fSsSM7lkrtwktacD0CR5kXaCqsWdGI9E08YUqHujv+fsBq
         4cBRnHttYTSjA==
Date:   Wed, 11 Aug 2021 12:47:55 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 19/19] auxdisplay: ht16k33: Add LED support
Message-ID: <20210811124755.37b0a0a9@thinkpad>
In-Reply-To: <20210811095759.1281480-20-geert@linux-m68k.org>
References: <20210811095759.1281480-1-geert@linux-m68k.org>
        <20210811095759.1281480-20-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 11 Aug 2021 11:57:59 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Instantiate a single LED based on the "led" subnode in DT.
> This allows the user to control display brightness and blinking (backed
> by hardware support) through the LED class API and triggers, and exposes
> the display color.  The LED will be named
> "auxdisplay:<color>:<function>".
>=20
> When running in dot-matrix mode and if no "led" subnode is found, the
> driver falls back to the traditional backlight mode, to preserve
> backwards compatibility.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

BTW, this driver does not need to depend on OF, methinks.
The few instances of properties reading can be
easily rewritten to device_* functions (from include/linux/property.h).
The of_get_child_by_name() can become device_get_named_child_node().

Geert, what do you think?

Marek
