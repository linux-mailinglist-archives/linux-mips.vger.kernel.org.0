Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDE626784C
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 08:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgILGqk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 02:46:40 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:51522 "EHLO
        out28-197.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgILGqd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 02:46:33 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07457393|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.128661-0.000966969-0.870372;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07447;MF=zhouyu@wanyeetech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.IW6khOv_1599893185;
Received: from 192.168.178.128(mailfrom:zhouyu@wanyeetech.com fp:SMTPD_---.IW6khOv_1599893185)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 12 Sep 2020 14:46:25 +0800
Subject: Re: [PATCH 3/3] MIPS: DTS: img: marduk: Add NXP SC16IS752IPW
To:     Hauke Mehrtens <hauke@hauke-m.de>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu
References: <20200815163514.11631-1-hauke@hauke-m.de>
 <20200815163514.11631-3-hauke@hauke-m.de>
From:   Zhou Yanjie <zhouyu@wanyeetech.com>
Message-ID: <4f182366-c042-0596-dbe0-d209f2e3e114@wanyeetech.com>
Date:   Sat, 12 Sep 2020 14:46:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200815163514.11631-3-hauke@hauke-m.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Hauke,

I would like to ask how to write UART nodes of SC16IS752, our CU1000-Neo 
board also uses SC16IS752 to expand GPIOs and UARTs, and the bluetooth 
module (from AP6212A) is connected to UART expanded by SC16IS752, but I 
don't know how to write UART node, so bluetooth cannot be used normally 
at present.

Thanks and best regards£¡

ÔÚ 2020/8/16 ÉÏÎç12:35, Hauke Mehrtens Ð´µÀ:
> Add NXP SC16IS752IPW SPI-UART controller to device tree.
>
> This controller drives 2 UARTs and 7 LEDs on the board.
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>   arch/mips/boot/dts/img/pistachio_marduk.dts | 51 +++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>
> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
> index 633a41954cc0..f4965a484b72 100644
> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
> @@ -46,6 +46,46 @@
>   		regulator-max-microvolt = <1800000>;
>   	};
>   
> +	/* EXT clock from ca8210 is fed to sc16is752 */
> +	ca8210_ext_clk: ca8210-ext-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <16000000>;
> +		clock-output-names = "ca8210_ext_clock";
> +	};
> +
> +	gpioleds {
> +		compatible = "gpio-leds";
> +		user1 {
> +			label = "marduk:red:user1";
> +			gpios = <&sc16is752 0 GPIO_ACTIVE_LOW>;
> +		};
> +		user2 {
> +			label = "marduk:red:user2";
> +			gpios = <&sc16is752 1 GPIO_ACTIVE_LOW>;
> +		};
> +		user3 {
> +			label = "marduk:red:user3";
> +			gpios = <&sc16is752 2 GPIO_ACTIVE_LOW>;
> +		};
> +		user4 {
> +			label = "marduk:red:user4";
> +			gpios = <&sc16is752 3 GPIO_ACTIVE_LOW>;
> +		};
> +		user5 {
> +			label = "marduk:red:user5";
> +			gpios = <&sc16is752 4 GPIO_ACTIVE_LOW>;
> +		};
> +		user6 {
> +			label = "marduk:red:user6";
> +			gpios = <&sc16is752 5 GPIO_ACTIVE_LOW>;
> +		};
> +		user7 {
> +			label = "marduk:red:user7";
> +			gpios = <&sc16is752 6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
>   	leds {
>   		compatible = "pwm-leds";
>   		heartbeat {
> @@ -95,6 +135,17 @@
>   		extclock-freq = <16000000>;
>   		extclock-gpio = <2>;
>   	};
> +
> +	sc16is752: sc16is752@1 {
> +		compatible = "nxp,sc16is752";
> +		reg = <1>;
> +		clocks = <&ca8210_ext_clk>;
> +		spi-max-frequency = <4000000>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
>   };
>   
>   &spfi1 {
