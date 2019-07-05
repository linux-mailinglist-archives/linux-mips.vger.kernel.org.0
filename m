Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77B460A1B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2019 18:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfGEQU6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jul 2019 12:20:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:47820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbfGEQU6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Jul 2019 12:20:58 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56888216FD;
        Fri,  5 Jul 2019 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562343657;
        bh=C2I1Vzvp4R+iI5qqfSseyRi9fvb4pPn5vXYoJ1XhQhk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=raUqS2+Kvn8FoGgxcAykDtUXVUhARlXX/sGTcK188G8VhjONGbOzRwJP6ehInhn81
         m046pkOGykNeRLYZHUAV5V3YCbJLqcPYL3ML5aksdarTwetLl4eMiMY6wIXWlJBH+L
         JysmNDb9yZYQSNWabqYGhTxbp44eAKDMdjxDWgvU=
Received: by mail-qt1-f179.google.com with SMTP id h18so4242296qtm.9;
        Fri, 05 Jul 2019 09:20:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVbsnBgtZKgZPem0y+fbMvNplUW9fNxLKsvCxcJk2+dqSFDY8Qy
        l60w65w1zmSr88i5lWOclQrcgiX4cXmLMhujIQ==
X-Google-Smtp-Source: APXvYqxTgmlpUn4krEylX9QF3EJfhq9faEdUppDuCVY+WbzBYGT2sNURu8a6A3PlLeGXAvS57X83Y4oyd4VS+/muFmI=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr3383843qtb.224.1562343656633;
 Fri, 05 Jul 2019 09:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com> <20190704122319.8983-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190704122319.8983-2-martin.blumenstingl@googlemail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 5 Jul 2019 10:20:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ7iA2kPBPLxkUVYXojqB7Hv69Nv4z3qaQveH24b45Jug@mail.gmail.com>
Message-ID: <CAL_JsqJ7iA2kPBPLxkUVYXojqB7Hv69Nv4z3qaQveH24b45Jug@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: add binding for the Lantiq
 VRX200 and ARX300 PCIe PHYs
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 4, 2019 at 6:23 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> The IP block contains settings for the PHY and a PLL.
> The PLL mode is configurable through a dedicated #phy-cell in .dts.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 95 +++++++++++++++++++
>  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
>  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

Reviewed-by: Rob Herring <robh@kernel.org>
