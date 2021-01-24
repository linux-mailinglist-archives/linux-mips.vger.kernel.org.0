Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489A3301A5F
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 08:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbhAXHpU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 02:45:20 -0500
Received: from mout.gmx.net ([212.227.15.19]:49167 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbhAXHpN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 02:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611474221;
        bh=OzYLP7bd+NogIspwmYH+noZpI7fU9a6uiUPHoTb80S0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=VoPpehlUxUBB9DCfK5PR0/3dFVIi1v8HSW3gzd3fvVFSYU4O/eHknApRgGgf9CKGe
         RmJxeEEr4g+hUxA8nw/eR7uYJsFb+FOHS0gQ9ZSd/HPiV6RP1u9NUziO5rrNWjQYLx
         O0TinthBWDe97B3VGqvk5EUqHvxVaLkcSwusC77g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.167.181]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mplc7-1lmWiP2fbp-00q71v; Sun, 24
 Jan 2021 08:43:40 +0100
Date:   Sun, 24 Jan 2021 09:45:23 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] input: Add N64 controller driver
Message-Id: <20210124094523.0a49bcf8867fad7582868eb5@gmx.com>
In-Reply-To: <20210115133408.0acd70163b582b77ad0a029b@gmx.com>
References: <20210115133408.0acd70163b582b77ad0a029b@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:11PzvU7PoBfij1d9SZSZOXLFglA4aAC1ZZJmAay4xi7XkHxnOOp
 wlrC5YcmvqpiaeQAt91jCS9suz+xX8aq5RJKLAoLIqyZQnwjoAONsrqi11euOjGzExcrj+5
 NgutICoaq0zpeur2bhRJnXeFdjNZtUpHmqNeNPh3EPeaN7MCBDePjrZP++P7p6yGaYnp4Op
 kFboS1mevKU1yBBJpI4tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dLX/gYCewNc=:mZoquaJM0VpVa7F3hSxYJw
 a2XclayeFnq1HB06VeyVRsmGtpojmwSwalIg2sNk9DjJwnpQciVFlTdP+SKDP5XAINFobLjmp
 4ALCdQM5ULg/1Gt5KSALQDZR6QXCx/XcGWzdz6XIKD1UHD9Ri6sO3dTw3ES1bq6LYcUyvNy9I
 DMfR8VchHLV4ZL1i8m84teWEPBGPEFfVFnVTf2jCdIQVeE1lrgriW084p7CCdH4gWd2VfO8W3
 2HSLOkl1UMxa7iXja+MRDAw+ZYrPu0OYewwrbkfe8Gr5nc9PBoJf9xn0ZQVf9jnoKNGsLnnO6
 AG9Zh0tctcjM7ENgYNZOHPPIMAfY385AsGqgPYIk8YHhUWcXwgRo/qNCnwklYVRzOKEa3hooM
 7nqSYtBKm2ham0lCYf/breQz94Ykxr7ILumtQ4Z1+R7XH2jw25wKTJ4n1Y+A3+7GGl6drt7ds
 nB1eBD0UkW17yr9Hm8ZQm8G2/N0NUPF5p0hHvIHH9BUG5/E3eBeNHCjd/CW3VajrPnIcihaA+
 NAgUBGerciU08hwt7ZUSqlWApMuCq4cQogStMdIsH6kvkGQYbG9sLkgaJ2btq2VdV5nO1IkGu
 P+we6X4ZKK6YU60GbfftSz5ADf4V9TjBCPqgbt6rsVC2dB3rdMCvvKzFqaKZzDGGSV3zYqY3l
 bbIXVvrGADLmmF2cUwISV2wJmyU1YaEPvRgOhTjDgY7sEM/tPtC+5cZIh59f43AN5jFyQ9egC
 cPTGkZrnMLJMDc3kKDn/fhjq5khgF9483jlf0GPEN6bOhldlp2FzsLZ8lBI+EhXxtk22ez7OP
 6gKwhVaTyTzGz/c8g4zxsbx/SuJScCVh/tLB8Ht+R36CFdgMckKf/MjLxxXqYlesrJIm/4tWh
 YEAXCrKCMSFB85MDNo1g==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Jan 2021 13:34:08 +0200
Lauri Kasanen <cand@gmx.com> wrote:

> This adds support for the four built-in controller
> ports on the Nintendo 64 console. The N64 controller
> includes an analog stick, a d-pad, and several buttons.
>
> No module support as the target has only 8mb ram.
>
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>
> v7: use devm_platform_ioremap_resource

Hi,

Ping on this patch.

- Lauri
