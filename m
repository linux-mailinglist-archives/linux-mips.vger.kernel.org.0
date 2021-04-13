Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D210235E6DB
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 21:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348028AbhDMTFk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 15:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230123AbhDMTFk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 15:05:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6DBF613CA;
        Tue, 13 Apr 2021 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618340719;
        bh=5Hi5Yc4/YAdXsswaYvFvmDelGHP+k/EQ+wxEZY8f19A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fkbVRaPnQjmQ8nJn7l9etFTOCdRTCttnSqd3PbxSmM0QEEmHh46JJSAQlBBckHy4e
         /qHYKlnQsZ5SyHV6V0pRW5R7YjHRJcqgpWKCnaSW6I6hL7dvaqJC7DcltTZhFKOOYO
         P/0qw4nkzqX0ZEOk7T+ZRxzJllQWD6u8gmToSuK6W+gfo9WffRg/gSRrj/4cde0Vcz
         5bTlu3qTqSgAqxKq41SeGxgnOROkDKbKT0Tv6RJZYkS2NR7+zX2UGgClfTPx7uuU8F
         hZIfomSeIyzjah+rKTgPwQ0HHnUmMI9Yq9XF7AOVZVex7wSp2YeP00eGOb7P1Ha3Iu
         22Cdf9P6SXvAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410055059.13518-3-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com> <20210410055059.13518-3-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v13 2/4] staging: mt7621-dts: make use of new 'mt7621-clk'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Apr 2021 12:05:18 -0700
Message-ID: <161834071831.3764895.1341697791144170137@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-04-09 22:50:57)
> Clocks for SoC mt7621 have been properly integrated so there is
> no need to declare fixed clocks at all in the device tree. Remove
> all of them, add new device tree nodes for mt7621-clk and update
> the rest of the nodes to use them.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
