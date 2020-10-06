Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A80C284407
	for <lists+linux-mips@lfdr.de>; Tue,  6 Oct 2020 04:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgJFCRk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 22:17:40 -0400
Received: from mail-dm6nam12on2049.outbound.protection.outlook.com ([40.107.243.49]:37344
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725870AbgJFCRk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Oct 2020 22:17:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/h1BWTNuokU7YggvlMnVMq2m955hxdWbCPqWf2LsD7KrLaZvvnVIKl+P9dmiHtK/DJ6ES00//WFwpY/vMjYUG3IZslMEYEwY0k0Nw7uWcszSjid6Gu8WILxe1nFCVptuf85/IqLroZwFiTp+ppjfyr399EOYudkSWvhn80syI19Cb9JxBRMTBc2kO9fW859Q/e05rKmhYc/tnlGqgKHfS195RqyFxY9Do7dg4YtYLD1W8jpmLqb0y5arptJcN8F6ysWSbp+6BavLtZKyuGi0a/JM6cvRVldpGQzMbprStm//TQQK+KwbFZzOnSFcaoEdnuHp4W+coN6vwC8JGASUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsgKR+uTTyEDf4YuDPnotldBpHzN9BpUWfW/G54U1YE=;
 b=FjuQmlBqnTS1GD8mk2vtegtgqYV3qIW+Bb7uTLP2dI96BAluzxvbmLCZ81FxdpfHjk/m/Lk/y+ARrfKoYA3lRxBllImfiI5XtbHqV3PTSSYWyDYmjDpR8zT8zcCjI7Bfpz2TllBpgnbu+88FOB38uCe1ZWUdXVZf6m4gl1EuiYFIkoiUeSDn+a100uKq7SEpgIU6EtS6H4GmRDVjas0+icIFzj3OYFZ3my80mq7cBCRT83Hnona1GGL4oMhtsoDtNPZ7gkZvPreAHDdc0lr6x52LKrlWS4D5Ry5cc1JR4pQbmuC2ZdTITYAMrLYLDGyapkZO6YqjzomemtP7JXq/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsgKR+uTTyEDf4YuDPnotldBpHzN9BpUWfW/G54U1YE=;
 b=eNFIMgmqXXbaSCK/NyTw7LBI6PBX4/0P6kTqjt4uag0BQ7vaXkIDRjV8TM5lQx+V523x5KOjHLI5R/Wiht36U1p3OH6MmEao1AB2f5R7/pgsa3VIjE9lSRp2K8UaCUfcMURVALQh/Mx4uwmttDYKDCW/UGyN1kMQM4R8MHYHFWo=
Authentication-Results: lespocky.de; dkim=none (message not signed)
 header.d=none;lespocky.de; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB3856.namprd08.prod.outlook.com (2603:10b6:805:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 6 Oct
 2020 02:17:36 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::c989:9cea:baa6:8254]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::c989:9cea:baa6:8254%7]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 02:17:36 +0000
Date:   Mon, 5 Oct 2020 21:17:29 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201006021729.GA4822@labundy.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: DM5PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:3:ef::18) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by DM5PR04CA0056.namprd04.prod.outlook.com (2603:10b6:3:ef::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 02:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d59d84-e4bb-4172-853e-08d8699dfddf
X-MS-TrafficTypeDiagnostic: SN6PR08MB3856:
X-Microsoft-Antispam-PRVS: <SN6PR08MB3856E6365371B15C3BF3324FD30D0@SN6PR08MB3856.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyWpBj2mKGtt8BKZ+zMzO4L2kPZS3zA88g8PWH8LfuNPWKz1+wUeQxsHi+ym11FuTnhdbYKCwZJiAO7y48XSViARLIj6dhX1LI6MWHiUOVtHhH5M5axL5LXzG+AvNaBKwv/kP8E22B0WeqpOpfC/DsmWI6sy5dzISQnwfzQTUidHUAMepCOAtL6zOvlovhsl1SbgQvjd+F8sIu2EmE8tn4BTWoPjREwEFpUV2zBM81p7IXG2inaGgMBDU+4IX49NFAmRj742UuVwX2bUu/nnaitB1HpVzn/S1FZVwDsQuP1hOq4iRjwPY0XTtILyfVxV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(136003)(39830400003)(376002)(66556008)(7416002)(66476007)(66946007)(86362001)(54906003)(1076003)(36756003)(6666004)(5660300002)(2906002)(316002)(4326008)(8886007)(83380400001)(8676002)(2616005)(7696005)(55016002)(16526019)(186003)(6916009)(26005)(33656002)(8936002)(52116002)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1G4pMmpTRQhiz06Dk9nZXscYgIAY4eoGOeHpzrqRT6ls3Tqv6mCfPPv81RPhrIjxIXHbeSp2LqLWtFfO8I3ibA+TrJdDf682M08O5Gxhzb9vTaQob8oQsYffyv1IticXuPTP5RKhYun9VVEMzMTDF+hKP2f+QyMwuBGrenbBJIE8ipRAoF6GEeeijx0gCfIejQZCRvuDZApZcHXU/NCWvR4pq3mDhisGTU7rQiAgLmO2IQcZu6zlMKQR1ZPD8ltEloMiqCjq/iwWxP9d1RFZLr9/CHyp4RUchzpIXKtJr7RGixjDbO9WNr2QIcEjAPVQSXlqrcE+GJodeO0C+MwGxQ+YQLW3AEVV6ugT7oFs5bT+1+IX2df3ge46004vQonU0PB7rtJLY0/3ol785dRjROFfMt/1XDuxWqnSGo7Ll6GTz6RDNol6yBaR7ZPm4sE91VbA44N3PLZEB5cL9fTc850ZV/pzvg7lmvJ6fslOLHA8bw6qmE9F6tuxvUPDDA39nkX9HfH774quACmLhLzAKkUQv3YviZjOym6w4ugWx4qhyT+13lt10rhJMgZengDhlCS0JV/JBF0WFvIeh0cpoKgpHAzy35sd+vL07/El3l6DlvB5hpJRa3wxBfK+p3WhchFC22V2QUBOxOwvSgg9Zw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d59d84-e4bb-4172-853e-08d8699dfddf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 02:17:36.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2tWd4LckH+4fBsoSEKuig9Vj7+GHsRT7FGleNnuRf6jwF2ylZKHh13YSzxXrchqoaOKV4GFRfFw1ruxLCd7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB3856
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexander,

On Mon, Oct 05, 2020 at 10:34:42PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v6 -> v7:
>       * added warning message to commit message (Krzysztof Kozlowski)
>     
>     v6:
>       * added this patch to series
> 
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> index 541b06d80e73..92dc48a8dfa7 100644
> --- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> +++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> @@ -90,10 +90,11 @@ examples:
>              };
>      };
>  
> -    pwmleds {
> +    led-controller {
>              compatible = "pwm-leds";
>  
> -            panel {
> +            led-1 {
> +                    label = "panel";
>                      pwms = <&iqs620a_pwm 0 1000000>;
>                      max-brightness = <255>;
>              };
> -- 
> 2.20.1
> 

I like the consistency this brings. My only feedback is that in the other
examples I found (common.yaml and leds-gpio.yaml), the children count off
from 0 (e.g. led-0) instead of 1 as your series appears to.

That's not a huge deal; it simply seems more consistent to count from the
first index allowed by the regex (0). The patch is still fine, and so:

Acked-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy
