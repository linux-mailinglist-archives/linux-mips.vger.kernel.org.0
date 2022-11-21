Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF2C632A56
	for <lists+linux-mips@lfdr.de>; Mon, 21 Nov 2022 18:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiKURGt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Nov 2022 12:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiKURGq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Nov 2022 12:06:46 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 468BFC8454;
        Mon, 21 Nov 2022 09:06:44 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxAFl-00041n-04; Mon, 21 Nov 2022 18:06:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 28364C1C88; Mon, 21 Nov 2022 18:06:12 +0100 (CET)
Date:   Mon, 21 Nov 2022 18:06:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hauke@hauke-m.de,
        zajec5@gmail.com, zhouyanjie@wanyeetech.com,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com,
        f.fainelli@gmail.com
Subject: Re: [PATCH v8 0/2] dt-bindings: mips: add CPU bindings for MIPS
 architecture
Message-ID: <20221121170612.GE3200@alpha.franken.de>
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 06, 2022 at 06:29:43AM +0200, Sergio Paracuellos wrote:
> Hi all,
> 
> This series tries to make the correct thing to represent in schema
> all the current documentation related with MIPS CPUs.
> 
> Broadcom cpus node is a bit special and need to use the property
> 'mips-hpt-frequency' in the cpus node. Because of this I have introduced
> brcm/soc.yaml schema with current broadcom SoCs and making this property
> required as per Rob's v3 review comments.
> 
> Ingenic cpus have also its schema already mainlined. To unify things I
> have also put this information in this mips/cpus.yaml schema and remove
> the 'mips/ingenic/ingenic,cpu.yaml' schema. I have also added current
> maintainer as maintainer for this 'mips/cpus.yaml' file.
> 
> Thomas, are these patches going through the mips git tree?
> 
> Thanks,
>     Sergio Paracuellos
> 
> Changes in v8:
>   - Remove Hauke Mehrtens from brcm/soc.yaml maintainers as per Hauke Mehrtens's
>     requested in v7 response.
> 
> Changes in v7:
>   - Remove Rafał Miłecki from brcm/soc.yaml maintainers as per Rafał Miłecki's
>     requested in v6 response.
> 
> Changes in v6:
>   - Avoid 'convert' in SoC's patch commit message since this is just an
>     addition and nothing is removed in this patch.
>   - Add Florian Fainelli to maintainers of Broadcom SoC bindings
>   - Add Florian's Acked-by for broadcom SoC PATCH.
>   - Collect Rob's Reviewed-by for both patches.
> 
> Changes in v5:
>   - Address Krzysztof comments in v4:
>       - change BMIPS SoC compatibles into an enum and drop descriptions,
>       - Add blank line.
>       - Redo commit message since it is not a conversion to schema.
>       - Drop 'device tree bindings' from description.
>       - Properly describe 'mips-hpt-frequency'.
>   - Review cpus node and add a sample to check schema correctness.    
> 
> Changes in v4:
> - Address Rob's v3 review comments:
>     * Drop PATCH introducing special brcm,cpus.yaml only because properyu
>     'mips-hpt-frequency' is required and move this property to brcm/soc.yaml
>     schema.
>     * Remove 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml'
>     and add that information to general mips/cpus.yaml schema.
>     * Define all properties in mips/cpus.yaml and set 'additionalProperties'
>     to false.
> 
> Changes in v3:
> - cpus.yaml:
>     * address Krzysztof comment in v2:
>     * add Thomas as maintainer since this is architecture binding.
>     * s/cpu/CPU
>     * compatible goes first
>     * Add compatible 'mips,mips4Kc' as per Thomas request.
> - Introduce two new schemas for Broadcom BMIPS:
>     * soc.yaml: describing the BRCM SoC's
>     * brcm,bmips-cpus.yaml: describing the cpu nodes for this platform.
> 
> Previous series:
> v1: https://lore.kernel.org/all/CAMhs-H-eUTOHjAXAbywOXQJgc_j5Ex-1sB7eBZU_bWt1fpNVzA@mail.gmail.com/T/
> v2: https://lore.kernel.org/all/20220918112245.GA5555@alpha.franken.de/T/
> v3: https://lore.kernel.org/linux-devicetree/20220929072004.874795-1-sergio.paracuellos@gmail.com/T/#t
> v4: https://lore.kernel.org/linux-devicetree/20221001043855.933528-1-sergio.paracuellos@gmail.com/T/#t
> v5: https://lore.kernel.org/linux-devicetree/20221002091611.946210-1-sergio.paracuellos@gmail.com/T/#t
> v6: https://lore.kernel.org/linux-devicetree/20221004050924.986211-1-sergio.paracuellos@gmail.com/T/#t
> 
> Sergio Paracuellos (2):
>   dt-bindings: mips: add CPU bindings for MIPS architecture
>   dt-bindings: mips: brcm: add Broadcom SoCs bindings
> 
>  .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
>  .../devicetree/bindings/mips/brcm/soc.yaml    |  97 +++++++++++++++
>  .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
>  4 files changed, 212 insertions(+), 77 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> 
> -- 
> 2.25.1

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
