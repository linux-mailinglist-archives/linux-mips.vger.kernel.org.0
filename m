Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C7280FE5
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 11:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387604AbgJBJbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 05:31:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgJBJbX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 05:31:23 -0400
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55C432074B;
        Fri,  2 Oct 2020 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601631082;
        bh=Op9qQOvRCmtTi/qrFC6hcZ02Bsccu0GIK+GbgVOdmMs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jXh6dz5s7lSBsGhcBoH/Nc5LUh9VJtwNaauWo9Ob9Qu2czr336t8xQZ9ddQYJgwPQ
         RaOSwo52NMRRYNY1yUymOVxtN2YDch2fUv9SI2FlVH45kP8nUj4EOB35WkwVW6kIZv
         fAeICjNWdsNesqlwYmwXvieguXIxvQdd9MdxoK7A=
Received: by mail-ed1-f44.google.com with SMTP id n22so972291edt.4;
        Fri, 02 Oct 2020 02:31:22 -0700 (PDT)
X-Gm-Message-State: AOAM533yy1fF132y6YCIMWmW+SUbjxXL3DxZ1xoY6ee1RrlHiqJjmo05
        qzJ1AFumKdkUvUBkNV3Cj/b40/ftYgt0B4roHiI=
X-Google-Smtp-Source: ABdhPJwSknSWj02zDQZ7UIOFFH5LS9ug09W2SVgWJOywobkymy1Z3ojVUQEOY7JssA67iKKNGFW+qhSE5EESCA8tfes=
X-Received: by 2002:a50:a452:: with SMTP id v18mr225060edb.143.1601631080807;
 Fri, 02 Oct 2020 02:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-3-post@lespocky.de>
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 11:31:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
>
> The example was adapted in the following ways:
>
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules

tweak? or align?

>
> License was discussed with the original author.

Since you relicense their work, you need an ack or signed off from
every author. You cannot just say "I discussed" and post it. That way
I could pretend (lie) I talked to Linus and try to relicense Linux to
BSD...

You need acks/SoB from Peter and Russel.

Best regards,
Krzysztof
