Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D5F5E063
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 10:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfGCI6x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jul 2019 04:58:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37514 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfGCI6x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jul 2019 04:58:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id s20so1564247otp.4;
        Wed, 03 Jul 2019 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAu76Ghsvr1W5j1QydPulQlx7ZJYjzlKVY1X6/0TpYQ=;
        b=ZlkWDaRm+F6GwfJacfLPTumk+RVHVPMMeileI2NFwlgWvaiJJa1YnjrCbLUMsIZTUc
         CKx7yqQmO1MAkEU5RkkY+fqX+pcF6C5bvfgt6DU9YQ6315Rh4ppt4NckuFzlirtXJdW4
         bXauvIzlfByBCcQCbKj/dQMX+FO4YHk7dgt2BqHQWfBiN2GjTE1Kt7sRE/fpjaJZ233Y
         7EucpqztgtTjxkJuI2CJoELGbgQ0UsLqicla54UrQ1s6uI5Sm5cP55KZgAMPom6TI6Lh
         eDV3440fsQsEOPIEVaVO70VowN2JWlXH/Dl/w36YmK4Qx1CW/WuZmpxGGpX8efH5HEaO
         wt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAu76Ghsvr1W5j1QydPulQlx7ZJYjzlKVY1X6/0TpYQ=;
        b=sHywb0FLb2Z4mxmIKjmDJNsdGWfY6iISqSKrM17DPjAvg1WA3EAzbIWT4oJZNZu0rz
         aK5bSB3QNB7rgXd8OAEaKPONdddZvkU3pHNuexzXcQvs3efd5cfv3LUHx5P45CU2jmvQ
         P7Z5sQY+VECCLR04G0s3OMChLGNhqLv6IXIeHg84QUfdNoDTQ5M3HNTxSUgJzqgqk3q1
         GtmP1ecvEI3kzvFHtG8n/i7j+Uz6VCfOE33QuBbUgXkmQJ3vaHCqVd9o0O3vw9yEGcLM
         mKGGIHkZxP0s4UGMrMOBQP49pbAtU8ek9G2ra+LTZPG/afQVYZh0DnreHe+JA0GAiTQj
         QNSw==
X-Gm-Message-State: APjAAAWQ4LlPiwwViyd3kP8ru8QN5LkYisiDGMdf8AtH/CMM/p53gMEX
        J0lUSTIOC0/PGEBKKdzV0GMTEafw1x//8JJFvGk=
X-Google-Smtp-Source: APXvYqzGyUzewzJOLzZnZSEaNzpUQzbtDJSH6yWGpp+2eb3HVLQViI2Tq6G8hX6C+3lTL2C6HmGIAUahYpDsxQUBb1Q=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr26337864otu.96.1562144332818;
 Wed, 03 Jul 2019 01:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com> <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 10:58:41 +0200
Message-ID: <CAFBinCCWzLyhzVcqHR0RY9+cSqDZ3EdJEim8SP4Mr2Q3M=OKTg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
To:     Rob Herring <robh+dt@kernel.org>
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

Hi Rob,

On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jul 2, 2019 at 2:35 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> > The IP block contains settings for the PHY and a PLL.
> > The PLL mode is configurable through a dedicated #phy-cell in .dts.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
> >  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> >  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> >
> > diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..b7b222e772d0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> The preference is (GPL-2.0 OR BSD-2-Clause) for new bindings.
to make sure I understand this correctly:
the license is then only valid for the bindings - is it fine if the
driver uses GPL-2.0-only?

I don't have any datasheet for these SoCs so all my knowledge is based
on the GPL-2.0-only driver from the Lantiq board support package
(called "UGW").
the .yaml file is 100% my own work so I'm fine with having GPL-2.0 OR
BSD-2-Clause
however, that still has to be compatible with my driver, which I chose
to be GPL-2.0-only because that's the license from the Lantiq board
support package


Martin
